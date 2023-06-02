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
%a
ff_t = fft(func); %преобразование
aff_t = abs(ff_t); %модуль преобразования
saff_t = sort(aff_t, 'desc'); %сортированный 
l1 = length(saff_t);
L1 = round(l1/10); % 10% коэф
maxL = saff_t(L1);
for i=1:L
    if abs(ff_t(i)) < maxL
        ff_t(i) = 0;
    end
end
iff_t = ifft(ff_t); %Обратное преобразование


L1f = 0;
for i=1:L
    L1f = L1f + abs(other_func(i) - iff_t(i));
end
L1f
plot(t, other_func,'green')
hold on
plot(t, iff_t, 'red')
hold off
legend('Исходный сигнал', 'Восстановленный сигнал');
