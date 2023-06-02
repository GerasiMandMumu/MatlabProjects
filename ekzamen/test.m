t = linspace(0, 50, 50);
r = linspace(-0.5, 0.5, 50);
original = (1+t).^(3/2)+ sin(4*t); 
noisy = (1+t).^(3/2)+ sin(4*t) + r;
beforeSNR = 20*log10(norm(original(:), 1)/norm(original(:) - noisy(:),1));
imden = wdenoise(noisy, 3, 'Wavelet', 'db4');
afterSNR_ = 20*log10(norm(original(:), 1)/norm(original(:) - imden(:), 1));
subplot(1, 3, 1)
plot(original)
title('Original')
subplot(1, 3, 2)
plot(noisy)
title('Noisy')
subplot(1, 3, 3)
plot(imden)
title('Denoised')
