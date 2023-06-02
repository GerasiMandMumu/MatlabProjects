% %Изображение задано матрицей
% X = [1 2 4 2;3 5 6 5;2 4 2 1;1 3 1 0];
% Wa = [1/4 1/4 1/2 0;1/4 1/4 -1/2 0;1/4 -1/4 0 1/2;1/4 -1/4 0 -1/2];
% 
% WaT = Wa';
% Y = Wa * X * WaT;
% Y
% % Вейвлет-преобразованием Хаара, проведите сжатие данного изображения, используя порог 0,55.
% for i = 1:4
%      for j = 1:4
%         if abs(Y(i, j)) < 0.55
%             Y(i, j) = 0;
%         end
%      end
% end
% Y
% 
% 
% % Восстановите изображение.
% Ws = inv(Wa);
% WsT = Ws';
% Xn = Ws * Y * WsT;
% disp(['Востановленная матрица X: ']);
% Xn
% L1 = 0;
% for i = 1:4
%      for j = 1:4
%          L1 = L1 + abs((Xn(i, j) - X(i, j)));
%      end
% end
% disp(' Рассчитайте норму L1 разницы между исходным и сжатым изображениями');
% L1
% 
% 
% 
% % ----------2-------------------
% % Оригинальное изображение задано матрицей
% X = [1 2 4 2;3 5 6 5;2 4 2 1;1 3 1 0];
% % Изображение с шумами задано матрицей 
% X1 = [1 3 5 2;3 4 4 6;1 5 2 1;2 3 1 1];
% %  Рассчитайте соотношение «сигнал/шум», используя в качестве нормы L1
% beforeSNR = 20*log10(norm(X(:))/norm(X(:)-X1(:)));
% Y1 = Wa * X1 * WaT;
% Y1
% 
% for i = 1:4
%      for j = 1:4
%         if abs(Y1(i, j)) < 0.55
%             Y1(i,j) = 0;
%         end
%      end
% end
% Y1
% 
% Ws = inv(Wa);
% WsT = Ws';
% Xn = Ws * Y1 * WsT;
% disp (['Востановленная матрица X1: ']);
% Xn
% afterSNR_haar = 20*log10(norm(X(:))/norm(X(:)-Xn(:)));
% afterSNR_haar


clear all
close all
clc

%Исходник





X_original = [
    3	2	5	5;
    5	5	6	2;
    7	4	6	4;
    5	3	5	2;
    ];

%Порог
threshold = 0.3;

%Матрица преобразования Хаара
wa = [
    0.25 0.25 0.25 0.25;
    0.25 0.25 -0.25 -0.25;
    0.5 -0.5 0 0;
    0 0 0.5 -0.5;
    ];

waT = transpose(wa);

%Сжатое изображение
Y = wa*X_original*waT;

Y1 = Y;

%Обнуление с нужным порогом
for i = 1:4
    for j=1:4
        if abs(Y1(i,j)) < threshold
            Y1(i,j)=0;
        end
    end
end
% djklmno
%Подсчет нулей
num0=0;
for i = 1:4
    for j=1:4
        if Y1(i,j)==0
            num0=num0+1;
        end
    end
end
fprintf('Количество нулей: %d\n', num0);

%Обратная матрица
wai = inv(wa);
%Транспонированная матрица
waiT = transpose(wai);
%Восстановление
X_restored = wai*Y1*waiT;

L1 = 0;
for i=1:4
    for j=1:4
        L1 = L1 + abs(X_original(i,j)-X_restored(i,j));
    end
end
fprintf('L1: %d\n', L1);






%Исходник
X_orig = [
    5	7	4	1;
    4	5	3	1;
    6	6	3	2;
    6	6	4	3;
    ];
%Шумы

X_noise = [
   5.1	6.6	3.5	1.5;
    3.5	5.6	3.5	0.5;
    5.2	5.9	3.2	2;
    6.6	6	4.3	3.8;
    ];

%Сжатое изображение с шумами
Y_noise = wa*X_noise*waT;
for i = 1:4
    for j=1:4
        if abs(Y_noise(i,j)) < threshold
            Y_noise(i,j)=0;
        end
    end
end

%Исходник без шумов
X_de_noise = wai*Y_noise*waiT;

before = 20*log10(norm(X_orig(:),1)/(norm(X_orig(:)-X_noise(:),1)));
fprintf('Перед устранением шума = %.3f\n', before);

afterHaar = 20*log10(norm(X_orig(:),1)/(norm(X_orig(:)-X_de_noise(:),1)));
fprintf('После устранения шума = %.3f\n', afterHaar);
