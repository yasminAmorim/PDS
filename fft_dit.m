function X = fft_dit(x)
    N = length(x);
    %N = 16;
    
    if N == 1
        X = x;
    else
        x_par = x(1:2:N);
        x_impar = x(2:2:N);
        
        X_par = fft_dit(x_par);
        X_impar = fft_dit(x_impar);
        
        W = exp(-2i * pi * (0:N/2-1) / N);
        
        %X = zeros(1, N);
        
        X(1:N/2) = X_par + W .* X_impar;
        X(N/2+1:N) = X_par - W .* X_impar;
    end
end

