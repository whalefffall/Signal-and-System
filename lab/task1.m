

[y1, fs1] = audioread('C_01_01.wav');
[b_low,a_low] = butter(4, 50/(fs1/2), 'low');

N = [1, 2, 4, 6, 8, 16, 32, 64, 128, 256];
for i = 1:length(N)
    result_wave = zeros(length(y1),1);
    n = N(i);
    for j = 1:n
        d_low = (27.2784-5.77322) / n * (j-1) + 5.77322;
        d_high = (27.2784-5.77322) / n * (j) + 5.77322;
        low_frequency = 165.4 * (10^(0.06*d_low) - 1);
        high_frequency = 165.4 * (10^(0.06*d_high) - 1);
        wave = get_band(y1, fs1, low_frequency, high_frequency,b_low, a_low);
        result_wave = result_wave + wave;
    end
    result_wave = result_wave * norm(y1)/ norm(result_wave);
    audiowrite(['C_01_01_', num2str(n), '.wav'], result_wave, fs1);
end

[y2, fs2] = audioread('C_01_02.wav');
[b_low,a_low] = butter(4, 50/(fs2/2), 'low');

N = [1, 2, 4, 6, 8, 16, 32, 64, 128, 256];
for i = 1:length(N)
    result_wave = zeros(length(y2),1);
    n = N(i);
    for j = 1:n
        d_low = (27.2784-5.77322) / n * (j-1) + 5.77322;
        d_high = (27.2784-5.77322) / n * (j) + 5.77322;
        low_frequency = 165.4 * (10^(0.06*d_low) - 1);
        high_frequency = 165.4 * (10^(0.06*d_high) - 1);
        wave = get_band(y2, fs2, low_frequency, high_frequency,b_low, a_low);
        result_wave = result_wave + wave;
    end
    result_wave = result_wave * norm(y2)/ norm(result_wave);
    audiowrite(['C_01_02_', num2str(n), '.wav'], result_wave, fs1);
end

function wave = get_band(s, fs, low_frequency, high_frequency,b_low, a_low)
    len = length(s)/fs;
    t = (0:1/fs:len - 1/fs);
    [b, a] = butter(4, [low_frequency, high_frequency] / (fs / 2));
    y = filter(b, a, s);
    y = abs(y);
    mid_frequency = (low_frequency + high_frequency) / 2;
    sin_wave = sin(2 * pi * mid_frequency * t);
    sin_wave = sin_wave.';
    envelope = filter(b_low, a_low, y);
    wave = envelope .* sin_wave;
    % wave = envelope;
end
        