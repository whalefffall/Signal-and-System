a_x = [0,3/4, zeros(1,7), -1/2,0, -1/2, zeros(1,7), 3/4];
N = [0:2*pi/20:2*pi/20*19];
stem(N,a_x),xlabel('freq'),ylabel('value')