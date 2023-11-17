%Processamento digital de sinais 
%Yasmin de Amorim Eustáquio

x = [1, 1, 1, 1, 1, 1, 1, 1];
N = 8;

if N > length(x)
    x = [x zeros(1,N - length(x))];
end

X = fft_dit(x);
disp('Sinal de entrada:');
disp(x);
disp('FFT:');
disp(X);
figure()
stem(abs(X))
figure()
stem(angle(X))