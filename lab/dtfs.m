function a = dtfs(x,n_init)
N = size(x,2);
n = n_init;
if(n_init >= N ||n_init < 0) 
    n = n_init - floor(n_init/N) * N;
end
if (n_init == 0) 
    X = x; 
else
    X = [x(N-n+1: N),x(1:N-n)]; 
end
a = (1/N)*fft(X);
end
