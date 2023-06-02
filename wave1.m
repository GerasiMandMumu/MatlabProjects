clear
syms x k Pi
Num = 16;
Gr = 4;
f_x = Gr*(x-Num)^2;
f_x = expand(f_x);
a_0 = (1/Num) * int(f_x, x,0,2*Num);
a_k = (1/Num) * int(f_x*cos(Pi*k*x/Num), x,0,2*Num);
b_k = (1/Num)* int(f_x*sin(Pi*k*x/Num),x,0,2*Num);

for k=1:50
    a(k)=eval((1/Num) * int(f_x*cos(pi*k*x/Num), x,0,2*Num));
    b(k)=eval((1/Num)* int(f_x*sin(pi*k*x/Num),x,0,2*Num));
end
 
a(1)
b(1)
t = linspace(0, 2*Num, 257);
y = Gr*(t - Num).^2;
s_0=a_0/2 + t.*0;

figure;
plot(t, y, 'green');
hold on;
plot(t, s_0, 'red');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_0(t)');
s_1 = s_0+a(1)*cos(pi*1*t./Num)+b(1)*sin(pi*1*t./Num);
figure;
plot(t, y, 'green');
hold on;
plot(t, s_1, 'blue');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_1(t)');
title('S1');

s_2 = s_1+a(2)*cos(pi*2*t./Num)+b(2)*sin(pi*2*t./Num);
figure;
plot(t, y, 'green');
hold on;
plot(t,s_2, 'magenta');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_2(t)');

s_k = s_2+a(3)*cos(pi*3*t./Num)+b(3)*sin(pi*3*t./Num);
for k=4:50
     s_k = s_k + a(k)*cos(pi*k*t./Num)+b(k)*sin(pi*k*t./Num);
end
figure;
plot(t, y, 'green');
hold on;
plot(t, s_k, '--');
hold off;
legend('Разложение функции f(t)', 'Приближение суммой S_{50}(t)');

for i=1:257
     d(i)=eval(abs(y(i)-s_k(i)));
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