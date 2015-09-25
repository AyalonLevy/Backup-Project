clear all; close all; clc;

n = 1000;
x = linspace(0,10*pi,n);
Sig = sin(x);

Sigma = 0.03*(max(Sig)-min(Sig)); % noise level
Nos_Sig1 = awgn(Sig,Sigma,'measured'); % noisy signal
Nos_Sig2 = Sig + Sigma*randn(1,n); % noisy signal

figure; plot(x,Sig,x,Nos_Sig1,x,Nos_Sig2); axis tight; title('Original and Noisy Signals'); ...
    legend('Original Signal','Signal with Noise 1','Signal with Noise 2')

%% PREPARE FOR DENOISING
% Rx = Nos_Sig'*Nos_Sig;
% [EVec_RX , EVal_RX] = eig(Rx);
% 
% U = EVec_RX';
% G = diag(

% Fft_Sig = fft(Sig);
% Fft_Sig_tmp = DFT_Fun(Sig)*n;
% Fft_Nos_Sig1 = fft(Nos_Sig1);
% Fft_Nos_Sig2 = fft(Nos_Sig2);

% n = length(Sig);
% P_Sig = abs(Fft_Sig).^2; % Spectral power
% Wie_Fltr = P_Sig./(P_Sig + n*Sigma^2);

% De_Nos_Sig1 = real(ifft(Fft_Nos_Sig1.*Wie_Fltr));
% De_Nos_Sig2 = real(ifft(Fft_Nos_Sig2.*Wie_Fltr));
Clean = WienerFilter(Sig,Nos_Sig1,Sigma);

% figure; plot(x,Sig,x,De_Nos_Sig1,x,De_Nos_Sig2,x,Clean); axis tight; title('Original Signal'); ...
%     legend('Original Signal','Denoised Signal 1','Denoised Signal 2','My Function')

figure; plot(x,Sig,x,Clean); axis tight; title('Original and Denoised Signals'); ...
    legend('Original Signal','Denoised Signal')