load soundingSignal40-48.mat
load rx_data_test3.mat

%%
rx_data_reshaped = reshape(rx_data, [21000,4]);
rx_data1 = rx_data_reshaped(:, 1).';
rx_data2 = rx_data_reshaped(:, 2).';
rx_data3 = rx_data_reshaped(:, 3).';
rx_data4 = rx_data_reshaped(:, 4).';

%%
current_data = rx_data2;

nfft = 4096;
r = current_data(10501:10501+nfft-1);
R = fft(r,nfft);

FF = -0.5:1/nfft:0.5-1/nfft;
figure(4);
% stem(FF,10*log10(abs(fftshift(R)))); grid on;
% ax = gca;
% ax.Children.BaseLine.BaseValue = -60;
% ax.Children.Marker = 'none';
plot(FF,10*log10(abs(fftshift(R)))); grid on;

willie = zeros(length(current_data)-length(s),1);
for idx = 1:length(willie)
    willie(idx) = current_data(idx:idx+length(s)-1) * s';
end

% figure(1);
% subplot(311); plot(real(willie)); grid on;
% subplot(312); plot(imag(willie)); grid on;
% subplot(313); plot(abs(willie)); grid on;