L = 256;
t = linspace(0, 2*pi, L);
Num = 16;
for i = 1:L 
    signal(i) = t(i)*(t(i)+Num)^(1/2);
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
func = signal + p_t + r_t + n_t;
other_func = signal + p_t + n_t;
%с
figure()
[c, z] = wavedec(func, 3, 'db4');
a_c = abs(c); %модуль преобразования
sorted_a_c = sort(a_c, 'desc'); %сортированный 
q = length(sorted_a_c);
L1 = round(q/10); % 10% коэф
maxL = sorted_a_c(L1);
for i=1:q
    if abs(c(i)) < maxL
        c(i) = 0;
    end
end
rec_c = waverec(c, z, 'db4'); %Обратное преобразование
L1db4 = 0;  %Норма
for i=1:L
    L1db4 = L1db4 + abs(other_func(i) - rec_c(i));
end

L1db4
plot(t, other_func,'green')
hold on
plot(t, rec_c, 'red')
hold off
legend('Исходный сигнал', 'Восстановленный сигнал');