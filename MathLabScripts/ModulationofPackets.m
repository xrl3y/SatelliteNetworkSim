% Simulation Parameters
fs = 10000;        % Sampling frequency (in Hz)
f_carrier_upload = 2000;  % Carrier frequency for the upload link (in Hz)
f_carrier_download = 1000; % Carrier frequency for the download link (in Hz)
f_message = 50;    % Message signal frequency (in Hz)
t = 0:1/fs:0.2;    % Simulation time for a packet (0.2 seconds)

% Message signal (representing a data packet)
message_signal = sin(2*pi*f_message*t);

% Amplitude Modulation (AM) for each link
am_signal_upload = (1 + 0.5 * message_signal) .* cos(2*pi*f_carrier_upload*t);
am_signal_download = (1 + 0.5 * message_signal) .* cos(2*pi*f_carrier_download*t);

% Plot the modulated signal for both links
figure;

% Upload link
subplot(3, 1, 1);
plot(t, am_signal_upload, 'b');
title('Upload Link: AM Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Download link
subplot(3, 1, 2);
plot(t, am_signal_download, 'g');
title('Download Link: AM Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Simulate the transmission of 10 packets with latency
subplot(3, 1, 3);
hold on;
title('Packet Transmission');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

n_packets = 10;       % Number of packets
avg_latency = 0.1;    % Average latency between packets (in seconds)

for i = 1:n_packets
    % Send packet from Upload Link to satellite
    plot(t + (i-1)*avg_latency, am_signal_upload, 'r');
    pause(0.2);  % Simulate upload transmission latency
    
    % Send packet from satellite to Download Link
    plot(t + (i-1)*avg_latency + 0.1, am_signal_download, 'k');
    pause(0.2);  % Simulate download reception latency
end

hold off;
