fs = 50;
Gr = 4;
Num = 16;
L = 256;
t = linspace(0, 2*pi, L);
f1 = cos(Gr*t + Num);
f2 = cos(2*(Gr*t + Num));

%1)
figure;
f_x1 = f1 + f2;
s = fft(f_x1, L);
w = (0:L - 1)/L*(fs/2);
subplot(2, 1, 1);
plot(t, f_x1);
title('f(t)');
subplot(2, 1, 2);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)|');

%2)
figure;
% получение результирующего массива
for i=1:L
    if (t(i) < pi)
        s(i) = cos(Gr*t(i) + Num);
    else
        s(i) = cos(2*(Gr*t(i) + Num));
    end
end
s1 = fft(s);
subplot (2, 1, 1);
plot(t, s)
title('f(t)');
w = (0:L - 1)/L*(fs/2);
subplot(2, 1, 2);
plot(w(1:20), abs(s1(1:20)'));
title('|F(ω)|');

% СРАВНЕНИЕ
figure;
subplot(4, 1, 1);
plot(t, f_x1);
title('f(t) a)');
subplot(4, 1, 2);
s = fft(f_x1, L);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)| a)');
for i=1:L
    if (t(i) < pi)
        s(i) = cos(Gr*t(i) + Num);
    else
        s(i) = cos(2*(Gr*t(i) + Num));
    end
end
subplot(4, 1, 3);
plot(t, s);
title('f(t) b)');
subplot(4, 1, 4);
plot(w(1:20), abs(s1(1:20)'));
title('|F(ω)| b)');


%3)
figure;
t = linspace(0, 2*pi, L);
f_x = sin(Gr*t + Num);
subplot(2, 1, 1);
plot(t, f_x);
title('f(t)');
s = fft(f_x, 256);
w = (0:L - 1)/L*(fs/2);
subplot(2, 1, 2);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)|');

%4)
figure;
for i=1:L
    if (t(i) < pi)
        yd(i) = sin(Gr*t(i) + Num);
    else
        yd(i) = sin(Gr*t(i) + Num) - 0.5;
    end
end
subplot(2, 1, 1);
plot(t, yd);
title('f(t)');
s = fft(yd, L);
w = (0:L - 1)/L*(fs/2);
subplot(2, 1, 2);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)|');

% СРАВНЕНИЕ
figure;
t = linspace(0, 2*pi, L);
f_x = sin(Gr*t + Num);
subplot(4, 1, 1);
plot(t, f_x);
title('f(t) c)');
s = fft(f_x, 256);
w = (0:L - 1)/L*(fs/2);
subplot(4, 1, 2);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)| c)');
for i=1:L
    if (t(i) < pi)
        yd(i) = sin(Gr*t(i) + Num);
    else
        yd(i) = sin(Gr*t(i) + Num) - 0.5;
    end
end
subplot(4, 1, 3);
plot(t, yd);
title('f(t) d)');
s = fft(yd, L);
w = (0:L - 1)/L*(fs/2);
subplot(4, 1, 4);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)| d)');

%5)
figure;
t = linspace(0, 2*Num, L);
f_x = Gr*(t - Num).^2;
subplot(2, 1, 1);
plot(t, f_x);
title('f(t)');
s = fft(f_x, L);
w = (0:L - 1)/L*(fs/2);
subplot(2, 1, 2);
plot(w(1:20), abs(s(1:20)'));
title('|F(ω)|');