orig = load('cat_original.mat');
synt = load('cat.mat');

figure;
subplot(1, 2, 1);
imagesc(orig.X);
title('Original');

subplot(1, 2, 2);
imagesc(synt.X);
title('Synthesis');