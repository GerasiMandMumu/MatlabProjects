% загрузить изображения без шума
%a = load('image_1.mat');
a = load('igood.mat');
% загрузить зашумленное изображение
%b = load('image_2.mat');
b = load('ibad.mat');

% a-e) для вейвлета Хаара с 3 уровнями разложения
% cоотношение сигнал\шум до устранения
beforeSNR = 20*log10(norm(a.X)/norm(a.X - b.X));
%  устранение шума, используя вейвлет Хаара с 3 уровнями разложения
h1 = wdenoise2(b.X, 3, 'Wavelet', 'haar');
% cоотношение сигнал\шум после устранения
afterSNR1 = 20*log10(norm(a.X)/norm(a.X - h1));

% a-e) вейвлеты Добеши 4
%  устранение шума, используя вейвлет вейвлеты Добеши 4
h2 = wdenoise2(b.X, 'Wavelet', 'db4');
% cоотношение сигнал\шум после устранения
afterSNR2 = 20*log10(norm(a.X)/norm(a.X - h2));


% a-e) биортогональные вейвлеты 4.4
%  устранение шума, используя вейвлет  биортогональные вейвлеты 4.4
h3 = wdenoise2(b.X);
% cоотношение сигнал\шум после устранения
afterSNR3 = 20*log10(norm(a.X)/norm(a.X - h3));


figure;
subplot(1, 3, 1);
imagesc(a.X);
title('Original');

subplot(1, 3, 2);
imagesc(b.X);
title('Noisy');

subplot(1, 3, 3);
imagesc(h2);
title('Denoised');

colormap gray