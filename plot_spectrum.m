clc; clear; close all;
load soundingSignal40-48-2.mat
load data/feb14/rx_data_ref_h.mat

%%
num_channels = 4;
tx_angle = 0;
trial = "B";

rx_data_reshaped = reshape(rx_data, [50000,num_channels]);
rx_data_arr = [];

for i = 1:num_channels
    rx_data_arr = [rx_data_arr ; rx_data_reshaped(:, i).'];
end


%%
nfft = 4096;

figure(1);
if (num_channels == 2)
    tcl = tiledlayout(1,2);
elseif (num_channels == 4)
    tcl = tiledlayout(2,2);
end

% main_title = strcat("Real Test @ ", num2str(tx_angle), " Trial ", trial);
main_title = "Reference Data - Horizontal port";

if (num_channels ~= 1) 
    t = title(tcl,main_title);
    t.FontSize = 16;
    t.FontWeight = 'bold';
end

x = 1:50000;

for i = 1:num_channels
    current_data = rx_data_arr(i,:);
    
    r = current_data(25501:25501+nfft-1);
    R = fft(r,nfft);
    
    FF = -0.5:1/nfft:0.5-1/nfft;

    nexttile;
%     plot(FF,10*log10(abs(fftshift(R)))); grid on;
    plot (x, imag(current_data)); grid on;
    sub_title = strcat("Channel ",num2str(i));
    if (num_channels ~= 1) 
        t = title(sub_title); 
        t.FontWeight = "normal";
    else 
        [t,s] = title(main_title, sub_title);
        s.FontAngle = 'italic';
    end
    ylabel("Power (dB)");
    xlabel("Frequency from carrier (fc = 3.7gHz)");
end

% this was used for the plotting above, not sure if it will be needed again
% stem(FF,10*log10(abs(fftshift(R)))); grid on;
% ax = gca;
% ax.Children.BaseLine.BaseValue = -60;
% ax.Children.Marker = 'none';


% willie = zeros(length(current_data)-length(s),1);
% for idx = 1:length(willie)
%     willie(idx) = current_data(idx:idx+length(s)-1) * s';
% end

% figure(1);
% subplot(311); plot(real(willie)); grid on;
% subplot(312); plot(imag(willie)); grid on;
% subplot(313); plot(abs(willie)); grid on;

