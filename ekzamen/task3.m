X = [1 2 4 2 3 5 6 5 2 4 2 1 1 3 1 0];

X1 = [1 3 5 2 3 4 4 6 1 5 2 1 2 3 1 1];

beforeSNR = 20*log10(norm(X(:),1)/norm(X(:)-X1(:), 1))

imden = wdenoise(X1, 3, 'Wavelet', 'db4');

afterSNR_db4 = 20*log10(norm(X(:), 1)/norm(X(:)-imden(:), 1))

subplot(1,3,1)
plot(X)
title('Original')

subplot(1,3,2)
plot(X1)
title('Noisy')

subplot(1,3,3)
plot(imden)
title('Denoised')
