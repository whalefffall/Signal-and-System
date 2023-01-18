x3 = [ones(1,8) zeros(1,24)];
a3 = 1/32*fft(x3);
l = 1:32;
a3_2 = [a3(1) a3(2) a3(3) zeros(1,27) a3(31) a3(32)];
x3_2 = 32*ifft(a3_2);
a3_8 = [a3(1:9) zeros(1,15) a3(25:32)];
x3_8 = 32*ifft(a3_8);
a3_12 = [a3(1:13) zeros(1,7) a3(21:32)];
x3_12 = 32*ifft(a3_12);
a3_all = [a3(1:32)];
x3_all = 32*ifft(a3_all);
%subplot(4,1,1),stem(l,x3_2),title('x3-2'),xlabel('x3-2'),ylabel('value');
%subplot(4,1,2),stem(l,x3_8),title('x3-8'),xlabel('x3-8'),ylabel('value');
%subplot(4,1,3),stem(l,x3_12),title('x3-12'),xlabel('x3-12'),ylabel('value');
%subplot(4,1,4),stem(l,x3_all),title('x3-all'),xlabel('x3-all'),ylabel('value');
%subplot(2,1,1),stem(l,real(x3_all)),title('x3-all'),xlabel('real part'),ylabel('value');
%subplot(2,1,2),stem(l,imag(x3_all)),title('x3-all'),xlabel('imag part'),ylabel('value');
subplot(4,1,1),stem(l,x3_2),title('x3-2'),hold on,stem(l,x3,'y'),xlabel('N = 4'),ylabel('value')
subplot(4,1,2),stem(l,x3_8),title('x3-8'),hold on,stem(l,x3,'y'),xlabel('N = 16'),ylabel('value')
subplot(4,1,3),stem(l,x3_12),title('x3-12'),hold on,stem(l,x3,'y'),xlabel('N = 24'),ylabel('value')
subplot(4,1,4),stem(l,x3_all),title('x3-all'),hold on,stem(l,x3,'y'),xlabel('N = 32'),ylabel('value'),hold off
