clear all; close all; clc;

% SIGNAL
% x = linspace(0,10*pi,n); Sig = sin(x); % Simple signal
Sig = pulse_equation();

n = length(Sig);
x = linspace(0,1,n);
Sigma = 0.03*(max(Sig)-min(Sig)); % noise level
Nos_Sig = Sig + Sigma*randn(1,n); % noisy signal

figure; plot(x,Sig,x,Nos_Sig); axis tight; title('Original and Noisy Signals'); ...
    legend('Original Signal','SNoised Noise')
% print('Original and Noisy Signals','-dpng')

%% DENOISING AND PLOTTING
Clean = WienerFilter(Sig,Nos_Sig,Sigma);

figure; plot(x,Sig,x,Clean); axis tight; title('Original and Denoised Signals'); ...
    legend('Original Signal','Denoised Signal')
% print('Original and Denoised Signals','-dpng')

figure; plot(x,Nos_Sig,x,Clean); axis tight; title('Noised and Denoised Signals'); ...
    legend('Noised Signal','Denoised Signal')
% print('Noised and Denoised Signals','-dpng')