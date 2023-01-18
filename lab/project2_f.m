clear;
close all;
clc;
addpath('data')
ScreenSize = get(0,'ScreenSize');

array_start_time = [0:0.5:9.5];
array_sample_shift = [0:1:5];%tau
array_Doppler_frequency = [-40:2:40];%f_d
band = 1;%{1,2}
f_c = 2.123e9;
f_s = 25e6;
lamda = 3e8/f_c; %wavelength
array_range = array_sample_shift/f_s*3e8;

%LPF
if band == 1
    f_ddc = -3e6;%ÏÂ±äÆµÆµÂÊ
    bandwidth = 9e6;
elseif band == 2
    f_ddc = 9.5e6;
end
f_cutoff = bandwidth;
thres_A_TRD = -10;
A_TRD = zeros(length(array_start_time), length(array_sample_shift), length(array_Doppler_frequency));
for ind_start_time = 1:length(array_start_time)
    %idx_start_time = 1;
    fprintf('[stat] Index of start time: %d / %d.\n', idx_start_time, length(array_start_time))
    %% Read Data File
    fprintf('[stat]  Read data file.\n')
    load(sprintf('data/data_%d.mat', idx_start_time))
    
    %% Digital downconvert
    fprintf('[stat]  Downconvert.\n')
    seq_ref_ddf = seq_ref.*exp(-1i*2*pi*f_ddc*[0:duration*f_s-1]/f_s);
    seq_sur_ddf = seq_sur.*exp(-1i*2*pi*f_ddc*[0:duration*f_s-1]/f_s);
    
    %%  LPF  design and check the LPF(by freqz)
    fprint('[stat]  LPF.\n')
    [b, a] = butter(20,f_cutoff/(f_s/2));
    seq_ref_lpf = filter(b,a,seq_ref_ddc);
    seq_sur_lpf = filter(b,a,seq_sur_ddc);
    
    %% Plot wavefomr and spectrum
    duration_plot = 0.01;
    num_t_axis_plot = duration_plot*f_s;
    num_f_axis_plot = num_t_axis_plot;
    t_axis_plot = 0:1/f_s:duration_plot-1/f_s;
    if idx_start_time == 1
        fig1 = figure(1);
        set(fig1,'Position', [1,41, 0.4*ScreenSize(3), 0.8*ScreenSize(4)]);
        subplot(6,2,1)
            plot(t_axis_plot*1e3, real(seq_ref(1,1:num_t_axis_plot)))
            xlabel('Time(ms)')
            ylabel('Amplitude')
            axis([0,duration_plot*1e3, -0.5e-3, 0.5e-3])
            title('Reference signal (raw)')
        subplot(6,2,2)
            plot(f_axis_plot/1e6, 20*log10(abs(fftshift(fft(seq_ref(1,1:num_t_axis_plot), num_f_axis_plot)))))
            xlabel('Frequency (MHz)')
            ylabel('Amplitude (dB)')
            axis([-f_s/2/1e6,f_s/2/le6, -100, 0])
            title('Spectrum (raw)')
        subplot(6,2,3)
            plot(t_axis_plot*1e3, real(seq_ref_ddc(1,1:num_t_axis_plot)))
            xlabel('Time(ms)')
            ylabel('Amplitude')
            axis([0,duration_plot*1e3, -0.5e-3, 0.5e-3])
            title('Reference signal (after DDC)')
        subplot(6,2,4)
            plot(f_axis_plot/1e6, 20*log10(abs(fftshift(fft(seq_ref_ddc(1,1:num_t_axis_plot), num_f_axis_plot)))))
            xlabel('Frequency (MHz)')
            ylabel('Amplitude (dB)')
            axis([-f_s/2/1e6,f_s/2/le6, -100, 0])
            title('Spectrum (after DDC)')
        subplot(6,2,5)
            plot(t_axis_plot*1e3, real(seq_ref_lpf(1,1:num_t_axis_plot)))
            xlabel('Time(ms)')
            ylabel('Amplitude')
            axis([0,duration_plot*1e3, -0.5e-3, 0.5e-3])
            title('Reference signal (after LPF)')
        subplot(6,2,6)
            plot(f_axis_plot/1e6, 20*log10(abs(fftshift(fft(seq_ref_lpf(1,1:num_t_axis_plot), num_f_axis_plot)))))
            xlabel('Frequency (MHz)')
            ylabel('Amplitude (dB)')
            axis([-f_s/2/1e6,f_s/2/le6, -100, 0])
            title('Spectrum (after LPF)')
        subplot(6,2,7)
            plot(t_axis_plot*1e3, real(seq_sur_ddc(1,1:num_t_axis_plot)))
            xlabel('Time(ms)')
            ylabel('Amplitude')
            axis([0,duration_plot*1e3, -2e-3, 2e-3])
            title('Surveillance signal (raw)')
        subplot(6,2,8)
            plot(f_axis_plot/1e6, 20*log10(abs(fftshift(fft(seq_sur_ddc(1,1:num_t_axis_plot), num_f_axis_plot)))))
            xlabel('Frequency (MHz)')
            ylabel('Amplitude (dB)')
            axis([-f_s/2/1e6,f_s/2/le6, -100, 0])
            title('Spectrum (raw)')
        subplot(6,2,9)
            plot(t_axis_plot*1e3, real(seq_sur_ddc(1,1:num_t_axis_plot)))
            xlabel('Time(ms)')
            ylabel('Amplitude')
            axis([0,duration_plot*1e3, -2e-3, 2e-3])
            title('Surveillance signal (after DDC)')
        subplot(6,2,10)
            plot(f_axis_plot/1e6, 20*log10(abs(fftshift(fft(seq_ref_ddc(1,1:num_t_axis_plot), num_f_axis_plot)))))
            xlabel('Frequency (MHz)')
            ylabel('Amplitude (dB)')
            axis([-f_s/2/1e6,f_s/2/le6, -100, 0])
            title('Spectrum (after DDC)')
        subplot(6,2,11)
            plot(t_axis_plot*1e3, real(seq_sur_lpf(1,1:num_t_axis_plot)))
            xlabel('Time(ms)')
            ylabel('Amplitude')
            axis([0,duration_plot*1e3, -2e-3, 2e-3])
            title('Surveillance signal (after LPF)')
        subplot(6,2,12)
            plot(f_axis_plot/1e6, 20*log10(abs(fftshift(fft(seq_sur_lpf(1,1:num_t_axis_plot), num_f_axis_plot)))))
            xlabel('Frequency (MHz)')
            ylabel('Amplitude (dB)')
            axis([-f_s/2/1e6,f_s/2/le6, -100, 0])
            title('Spectrum (after LPF)')
    end
    %% Ambiguity function
    fprint('[stat]  Ambiguity processing.\n')
    num_loop = length(array_sample_shift)*length(array_Doppler_frequency);
    t_axis = 0:1/f_s:(duration*f_s-1)/f_s;
    temp = zeros(1,num_loop);
end

T = 0.5;
N = 12500000;
y0 = 0;
function y = cor(y1, y2, c, d, t) 
 y = conv(y1,fliplr(y2))
end