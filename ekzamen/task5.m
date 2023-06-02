clear
syms x k Pi
Num = 16;
Gr = 4;
f_x = 10*x^3-5*x^2;
f_x = expand(f_x);
a_0 = (1/pi) * int(f_x, x, -pi, pi);
a_k = (1/pi) * int(f_x*cos(k*x), x, -pi, pi);
b_k = (1/pi)* int(f_x*sin(k*x),x, -pi, pi);

for k=1:50
    a(k)=eval((1/pi) * int(f_x*cos(k*x), x, -pi, pi));
    b(k)=eval((1/pi)* int(f_x*sin(k*x), x, -pi, pi));
end

a(1)
b(1)
t = linspace(0, 51, 50);
t_x = linspace(-pi, pi, 257);
y = 10*t_x.^3-5*t_x.^2;
s_0 = a_0/2 + t_x.*0;
figure;
plot(t_x, y, 'green');
hold on;
plot(t_x, s_0, 'red');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_0(t)');

figure
plot(t, a);
hold on
plot(t, b, 'r');
hold off
title('Коэффициенты');

s_1 = s_0+a(1)*cos(t_x)+b(1)*sin(t_x);  
figure;
plot(t_x, y, 'green');
hold on;
plot(t_x, s_1, 'blue');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_1(t)');
title('S1');

s_2 = s_1+a(2)*cos(2*t_x)+b(2)*sin(2*t_x);
figure;
plot(t_x, y, 'green');
hold on;
plot(t_x, s_2, 'magenta');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_2(t)');

s_k = s_2+a(3)*cos(3*t_x)+b(3)*sin(3*t_x);
for k=4:50
     s_k = s_k + a(k)*cos(k*t_x)+b(k)*sin(k*t_x);
end
figure;
plot(t_x, y, 'green');
hold on;
plot(t_x, s_k, '--');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_{50}(t)');

for i=1:257
     d(i)=eval(abs(y(i) - s_k(i)));
end
disp('f_x = ');
disp(f_x);
disp('a0 = ');
disp(a_0);
disp('a1 = ');
disp(a(1));
disp('a50 = ');
disp(a(50));
disp('b0 = ');
disp(b(1));
disp('b1 = ');
disp(b(2));
disp('b50 = ');
disp(b(50));
disp('Максимальная погрешность приближения функции f(t) частичной суммой S_{50}(t) = ');
disp(max(d));