% Parámetros de la simulación
fs = 10000;        % Frecuencia de muestreo (en Hz)
f_carrier_upload = 2000;  % Frecuencia de la portadora para el enlace de subida (en Hz)
f_carrier_download = 1000; % Frecuencia de la portadora para el enlace de bajada (en Hz)
f_message = 50;    % Frecuencia de la señal del mensaje (en Hz)
t = 0:1/fs:0.2;    % Tiempo de simulación para un paquete (0.2 segundos)

% Señal de mensaje (representando un paquete de datos)
message_signal = sin(2*pi*f_message*t);

% Modulación en amplitud (AM) para cada enlace
am_signal_upload = (1 + 0.5 * message_signal) .* cos(2*pi*f_carrier_upload*t);
am_signal_download = (1 + 0.5 * message_signal) .* cos(2*pi*f_carrier_download*t);

% Graficar la señal modulada en ambos enlaces
figure;

% Subida de paquetes (Upload Link)
subplot(3, 1, 1);
plot(t, am_signal_upload, 'b');
title('Enlace de Subida (Upload Link): Señal Modulada en AM');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Bajada de paquetes (Download Link)
subplot(3, 1, 2);
plot(t, am_signal_download, 'g');
title('Enlace de Bajada (Download Link): Señal Modulada en AM');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Simulación de la transmisión de 10 paquetes con latencia
subplot(3, 1, 3);
hold on;
title('Transmisión de Paquetes');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

n_paquetes = 10;       % Número de paquetes
latencia_prom = 0.1;   % Latencia promedio entre paquetes (en segundos)

for i = 1:n_paquetes
    % Enviar paquete desde Upload Link al satélite
    plot(t + (i-1)*latencia_prom, am_signal_upload, 'r');
    pause(0.2);  % Simulación de latencia de envío
    
    % Enviar paquete desde el satélite al Download Link
    plot(t + (i-1)*latencia_prom + 0.1, am_signal_download, 'k');
    pause(0.2);  % Simulación de latencia de recepción
end

hold off;
