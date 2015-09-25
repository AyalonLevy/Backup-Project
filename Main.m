clear all; close all; clc;

n = 1000;
x = linspace(0,10*pi,n);
Sig = sin(x);

Sigma = 0.03*(max(Sig)-min(Sig)); % noise level
Nos_Sig = Sig + Sigma*randn(1,n); % noisy signal

figure; plot(x,Sig,x,Nos_Sig); axis tight; title('Original and Noisy Signals'); ...
    legend('Original Signal','Signal with Noise 2')

%% PREPARE FOR DENOISING
Clean = WienerFilter(Sig,Nos_Sig,Sigma);

figure; plot(x,Sig,x,Clean); axis tight; title('Original and Denoised Signals'); ...
    legend('Original Signal','Denoised Signal')