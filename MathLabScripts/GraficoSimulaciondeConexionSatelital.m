% Definition of geographic coordinates for Bogotá (latitude and longitude)
lat_bogota = 4.7110;   % Latitude of Bogotá (in degrees)
lon_bogota = -74.0721;  % Longitude of Bogotá (in degrees)

% Geographic coordinates for Uribia (download)
lat_uribia = 11.6833;   % Latitude of Uribia (in degrees)
lon_uribia = -72.2042;  % Longitude of Uribia (in degrees)

% Parameters of the LEO satellite
altitude_satellite = 600;  % Altitude in km
lat_satellite = 5.0;      % Latitude of the satellite over Colombia (approximate)
lon_satellite = -74.0;    % Longitude of the satellite over Colombia (approximate)

% Earth's radius (in km)
radius_earth = 6371;

% Convert geographic coordinates to radians
lat_bogota_rad = deg2rad(lat_bogota);
lon_bogota_rad = deg2rad(lon_bogota);
lat_uribia_rad = deg2rad(lat_uribia);
lon_uribia_rad = deg2rad(lon_uribia);
lat_satellite_rad = deg2rad(lat_satellite);
lon_satellite_rad = deg2rad(lon_satellite);

% Cartesian coordinates
% Bogotá
x_bogota = radius_earth * cos(lat_bogota_rad) * cos(lon_bogota_rad);
y_bogota = radius_earth * cos(lat_bogota_rad) * sin(lon_bogota_rad);
z_bogota = radius_earth * sin(lat_bogota_rad);

% Uribia
x_uribia = radius_earth * cos(lat_uribia_rad) * cos(lon_uribia_rad);
y_uribia = radius_earth * cos(lat_uribia_rad) * sin(lon_uribia_rad);
z_uribia = radius_earth * sin(lat_uribia_rad);

% Satellite
x_satellite = (radius_earth + altitude_satellite) * cos(lat_satellite_rad) * cos(lon_satellite_rad);
y_satellite = (radius_earth + altitude_satellite) * cos(lat_satellite_rad) * sin(lon_satellite_rad);
z_satellite = (radius_earth + altitude_satellite) * sin(lat_satellite_rad);

% Plot Earth with satellite's orbit
figure;
hold on;

% Create Earth sphere with no color, just the border
[earth_x, earth_y, earth_z] = sphere(100);
surf(earth_x * radius_earth, earth_y * radius_earth, earth_z * radius_earth, 'FaceColor', 'none', 'EdgeColor', [0.5 0.5 0.5]);

% Plot satellite's orbit as a dashed line
theta = linspace(0, 2*pi, 200);  % Angle for the orbit
x_orbit = (radius_earth + altitude_satellite) * cos(theta);
y_orbit = (radius_earth + altitude_satellite) * sin(theta);
z_orbit = zeros(size(theta));  % Assuming orbit in the equatorial plane
plot3(x_orbit, y_orbit, z_orbit, 'k--', 'LineWidth', 1.5);

% Plot communication links (upload and download)
plot3([x_bogota, x_satellite], [y_bogota, y_satellite], [z_bogota, z_satellite], 'r-', 'LineWidth', 2); % Upload
plot3([x_satellite, x_uribia], [y_satellite, y_uribia], [z_satellite, z_uribia], 'b-', 'LineWidth', 2); % Download

% Plot positions
plot3(x_bogota, y_bogota, z_bogota, 'go', 'MarkerFaceColor', 'g');  % Bogotá (upload link)
plot3(x_uribia, y_uribia, z_uribia, 'mo', 'MarkerFaceColor', 'm');  % Uribia (download link)
plot3(x_satellite, y_satellite, z_satellite, 'ko', 'MarkerFaceColor', 'k');  % Satellite

% Labels and configuration
title('Satellite in Orbit over Colombia with Communication Links');
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
legend('Earth (Silhouette)', 'Satellite Orbit', 'Upload Link', 'Download Link', ...
       'Bogotá (Base Station)', 'Uribia (Download Station)', 'Satellite');
grid on;
axis equal;
hold off;
