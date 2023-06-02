%a
waveinfo('haar')
load sumsin 
plot(sumsin)
title('Signal')
wname = 'haar';
itr = 10;
Gr = 4;
Num = 16;
syms x
L = 256;
t = linspace(0,2*pi,L);
f_t = cos(Gr*t + Num) + cos(2*(Gr*t + Num));
[~,psi,xval] = wavefun(wname,0);
plot(xval,psi,'x-')
grid on
title(['Approximation of ',wname,' Wavelet'])
%--------------------------------------------------------
figure()
[c,l] = wavedec(f_t, 3, 'haar');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c, l, [1 2 3]);

subplot(5,1,1)
plot(f_t)
title('f(t)')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')
%------------------------------------------------------2
for i=1:L
    if (t(i) < pi)
        f(i) = cos(Gr*t(i) + Num);
    else
        f(i) = cos(2*(Gr*t(i) + Num)) - 0.5;
    end
end

figure()
[c,l] = wavedec(f, 3, 'haar');
approx = appcoef(c, l, 'db2');
[cd1,cd2,cd3] = detcoef(c, l, [1 2 3]);
subplot(5,1,1)
plot(f)
title('f(t)')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')



%-----------------------------------------------b
waveinfo('db')
figure()
fb = cos(Gr*t+Num)+cos(2*(Gr*t+Num));
[~,psi,xval] = wavefun('db4',0);
plot(xval,psi,'x-')
grid on
title('Approximation of db4 Wavelet')

figure()
[c,l] = wavedec(fb,3,'db4');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);

subplot(5,1,1)
plot(fb)
title('f(t)')


subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')



for i=1:L
    if (t(i) < pi)
        f(i) = cos(Gr*t(i) + Num);
    else
        f(i) = cos(2*(Gr*t(i) + Num))-0.5;
    end
end
figure()
[c,l] = wavedec(f,3,'db4');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);

subplot(5,1,1)
plot(f)
title('f(t)')


subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')




%-----------------------------------------------b
waveinfo('sym')
figure()
fb = cos(Gr*t+Num)+cos(2*(Gr*t+Num));
[~,psi,xval] = wavefun('sym2',0);
plot(xval,psi,'x-')
grid on
title('Approximation of sym2 Wavelet')
figure()
[c,l] = wavedec(fb,3,'bior2.2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);
subplot(5,1,1)
plot(fb)
title('f(t)')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')
for i=1:L
    if (t(i) < pi)
        f(i) = cos(Gr*t(i) + Num);
    else
        f(i) = cos(2*(Gr*t(i) + Num))-0.5;
    end
end
figure()
[c,l] = wavedec(f,3,'sym2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);
subplot(5,1,1)
plot(f)
title('f(t)')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')






%-----------------------------------------------b
waveinfo('bior')
figure()
fb = cos(Gr*t+Num)+cos(2*(Gr*t+Num));
[~,psi,xval] = wavefun('bior2.2',0);
plot(xval,psi,'x-')
grid on
title('Approximation of bior2.2 Wavelet')
figure()
[c,l] = wavedec(fb,3,'bior2.2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);
subplot(5,1,1)
plot(fb)
title('f(t)')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')
for i=1:L
    if (t(i) < pi)
        f(i) = cos(Gr*t(i) + Num);
    else
        f(i) = cos(2*(Gr*t(i) + Num))-0.5;
    end
end
figure()
[c,l] = wavedec(f,3,'bior2.2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);
subplot(5,1,1)
plot(f)
title('f(t)')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')

