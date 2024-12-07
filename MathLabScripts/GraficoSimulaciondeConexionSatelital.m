% Definición de coordenadas geográficas de Bogotá (latitud y longitud)
lat_bogota = 4.7110;   % Latitud de Bogotá (en grados)
lon_bogota = -74.0721;  % Longitud de Bogotá (en grados)

% Coordenadas geográficas de Uribia (descarga)
lat_uribia = 11.6833;   % Latitud de Uribia (en grados)
lon_uribia = -72.2042;  % Longitud de Uribia (en grados)

% Parámetros del satélite LEO
altitud_satellite = 600;  % Altitud en km
lat_satellite = 5.0;      % Latitud del satélite sobre Colombia (aproximada)
lon_satellite = -74.0;    % Longitud del satélite sobre Colombia (aproximada)

% Radio de la Tierra (en km)
radius_earth = 6371;

% Convertir coordenadas geográficas a radianes
lat_bogota_rad = deg2rad(lat_bogota);
lon_bogota_rad = deg2rad(lon_bogota);
lat_uribia_rad = deg2rad(lat_uribia);
lon_uribia_rad = deg2rad(lon_uribia);
lat_satellite_rad = deg2rad(lat_satellite);
lon_satellite_rad = deg2rad(lon_satellite);

% Coordenadas cartesianas
% Bogotá
x_bogota = radius_earth * cos(lat_bogota_rad) * cos(lon_bogota_rad);
y_bogota = radius_earth * cos(lat_bogota_rad) * sin(lon_bogota_rad);
z_bogota = radius_earth * sin(lat_bogota_rad);

% Uribia
x_uribia = radius_earth * cos(lat_uribia_rad) * cos(lon_uribia_rad);
y_uribia = radius_earth * cos(lat_uribia_rad) * sin(lon_uribia_rad);
z_uribia = radius_earth * sin(lat_uribia_rad);

% Satélite
x_satellite = (radius_earth + altitud_satellite) * cos(lat_satellite_rad) * cos(lon_satellite_rad);
y_satellite = (radius_earth + altitud_satellite) * cos(lat_satellite_rad) * sin(lon_satellite_rad);
z_satellite = (radius_earth + altitud_satellite) * sin(lat_satellite_rad);

% Graficar la Tierra con órbita del satélite
figure;
hold on;

% Crear la esfera de la Tierra sin color, solo borde
[earth_x, earth_y, earth_z] = sphere(100);
surf(earth_x * radius_earth, earth_y * radius_earth, earth_z * radius_earth, 'FaceColor', 'none', 'EdgeColor', [0.5 0.5 0.5]);

% Graficar órbita del satélite como línea punteada
theta = linspace(0, 2*pi, 200);  % Ángulo para la órbita
x_orbit = (radius_earth + altitud_satellite) * cos(theta);
y_orbit = (radius_earth + altitud_satellite) * sin(theta);
z_orbit = zeros(size(theta));  % Asumiendo órbita en el plano ecuatorial
plot3(x_orbit, y_orbit, z_orbit, 'k--', 'LineWidth', 1.5);

% Graficar conexiones (upload y download)
plot3([x_bogota, x_satellite], [y_bogota, y_satellite], [z_bogota, z_satellite], 'r-', 'LineWidth', 2); % Upload
plot3([x_satellite, x_uribia], [y_satellite, y_uribia], [z_satellite, z_uribia], 'b-', 'LineWidth', 2); % Download

% Graficar posiciones
plot3(x_bogota, y_bogota, z_bogota, 'go', 'MarkerFaceColor', 'g');  % Bogotá (upload link)
plot3(x_uribia, y_uribia, z_uribia, 'mo', 'MarkerFaceColor', 'm');  % Uribia (download link)
plot3(x_satellite, y_satellite, z_satellite, 'ko', 'MarkerFaceColor', 'k');  % Satélite

% Etiquetas y configuración
title('Satélite en Órbita sobre Colombia con Enlaces de Comunicación');
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
legend('Tierra (Silhouette)', 'Órbita del Satélite', 'Enlace Upload', 'Enlace Download', ...
       'Bogotá (Estación Base)', 'Uribia (Estación de Descarga)', 'Satélite');
grid on;
axis equal;
hold off;
