t = [0:0.01:9.99];
yt = exp(-2*abs(t-5));
plot(t,yt),xlabel('t'),ylabel('yt')