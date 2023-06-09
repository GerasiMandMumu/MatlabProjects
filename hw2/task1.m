Num = 16;
Gr = 4;

for i=1:8
    for j=1:8
        X(i,j) = mod((Gr*i + Num*j), 23);
    end
end
disp('Матрица X');
X

disp('Прямое преобразование: Y = Wa*X');
disp('Матрица прямого преобразования двумерного сигнала:');

Wa = [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125;0.125 0.125 0.125 0.125 -0.125 -0.125 -0.125 -0.125;0.25 0.25 -0.25 -0.25 0 0 0 0;0 0 0 0 0.25 0.25 -0.25 -0.25;0.5 -0.5 0 0 0 0 0 0;0 0 0.5 -0.5 0 0 0 0;0 0 0 0 0.5 -0.5 0 0;0 0 0 0 0 0 0.5 -0.5];
Wa
%Wat = transpose(Wa);
%Y = Wa*X*Wat;
Y = Wa*X;
disp('Полученная матрица вейвлет-коэффициентов Y:');
Y

for i=1:8
    for j=1:8
        if (abs(Y(i,j))<1)
            Y(i,j)=0;
        end
    end
end
disp('Матрица после обнуления части коэффициентов Y1:');
Y

Ws = inv(Wa);
%x_inv = Ws*Y*transpose(Ws);
x_inv = Ws*Y;
disp('Обратное преобразование: X = Ws*Y');
disp('Матрица обратного преобразования двумерного сигнала:');
Ws
disp('Восстановленная матрица X1:');
x_inv

disp('Норма погрешности L1:');
L1 = 0;
n = 8;
for i=1:n
    for j=1:n
        L1 = L1 + abs((X(i, j) - x_inv(i, j)));
    end
end
L1
        