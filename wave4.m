L = 256;
t = linspace(0, 2*pi, L);
Num = 16;
for i = 1:L 
    s_t(i) = t(i)*(t(i)+Num)^(1/2);
end

for i=1:L
    if (t(i) < pi)
        p_t(i) = cos(2*(4*t(i) + Num));
       
    else
         p_t(i) = cos(4*t(i) + Num);
    end
end

for i=1:L
    r_t(i) = rand()-0.5; 
end

n_t = zeros(1,L);
n_t(64)=-8;

f_t = s_t + p_t + r_t + n_t;

f1_t = s_t + p_t + n_t;

%a
ff_t = fft(f_t); %преобр Фурье
aff_t = abs(ff_t); %модуль преобр Фурье
saff_t = sort(aff_t, 'desc'); %сортированный 
l1 = length(saff_t);
L1 = round(l1/10); % 10% коэф
maxL = saff_t(L1);

for i=1:L
    if abs(ff_t(i)) < maxL
        ff_t(i) = 0;
    end
end

iff_t = ifft(ff_t); %Обратное преобр

L1f = 0;
for i=1:L
    L1f = L1f + abs(f1_t(i) - iff_t(i));
end
L1f
plot(t, f1_t,'green')
hold on
plot(t, iff_t, 'red')
hold off
legend('Исходный сигнал', 'Восстановленный сигнал');
%b
figure()
[c,l] = wavedec(f_t,3,'haar');
a_c = abs(c); %модуль преобр Фурье
sa_c = sort(a_c, 'desc'); %сортированный 
l1 = length(sa_c);
L1 = round(l1/10); % 10% коэф
maxL = sa_c(L1);

for i=1:l1
    if abs(c(i)) < maxL
        c(i) = 0;
    end
end

rec_c = waverec(c,l,'haar'); %Обратное преобр

L1h = 0;  %НОрма
for i=1:L
    L1h = L1h + abs(f1_t(i) - rec_c(i));
end
L1h
plot(t, f1_t,'green')
hold on
plot(t, rec_c, 'red')
hold off
legend('Исходный сигнал', 'Восстановленный сигнал');
%с
figure()
[c,l] = wavedec(f_t,3,'db4');
a_c = abs(c); %модуль преобр Фурье
sa_c = sort(a_c, 'desc'); %сортированный 
l1 = length(sa_c);
L1 = round(l1/10); % 10% коэф
maxL = sa_c(L1);

for i=1:l1
    if abs(c(i)) < maxL
        c(i) = 0;
    end
end

rec_c = waverec(c,l,'db4'); %Обратное преобр

L1db4 = 0;  %НОрма
for i=1:L
    L1db4 = L1db4 + abs(f1_t(i) - rec_c(i));
end
L1db4
plot(t, f1_t,'green')
hold on
plot(t, rec_c, 'red')
hold off
legend('Исходный сигнал', 'Восстановленный сигнал');
%d
figure()
[c,l] = wavedec(f_t, 3, 'bior2.2');
a_c = abs(c); %модуль преобр Фурье
sa_c = sort(a_c, 'desc'); %сортированный 
l1 = length(sa_c);
L1 = round(l1/10); % 10% коэф
maxL = sa_c(L1);

for i=1:l1
    if abs(c(i)) < maxL
        c(i) = 0;
    end
end

rec_c = waverec(c,l,'bior2.2'); %Обратное преобр

L1bior2 = 0;  %Норма
for i=1:L
    L1bior2 = L1bior2 + abs(f1_t(i) - rec_c(i));
end
L1bior2
plot(t, f1_t,'green')
hold on
plot(t, rec_c, 'red')
hold off

legend('Исходный сигнал', 'Восстановленный сигнал');
%ТАБЛИЦА СРАВННЕНИЯ НОРМ
