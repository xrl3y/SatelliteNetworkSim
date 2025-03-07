% Create the satellite communication scenario
sc = satelliteScenario;

% General parameters
simulationDuration = hours(24); % Simulation duration (24 hours)
sc.StopTime = datetime("now") + simulationDuration;

% --- GEO ORBIT ---
% GEO orbital parameters
semiMajorAxisGEO = 42164e3; % Semi-major axis for GEO (Earth radius + altitude)
eccentricityGEO = 0; % Circular orbit
inclinationGEO = 0; % Equatorial orbit
raanGEO = 0; % Right ascension of the ascending node
argumentOfPeriapsisGEO = 0; % Argument of perigee
trueAnomalyGEO = 0; % Initial true anomaly

% Create GEO satellite
geoSat = satellite(sc, semiMajorAxisGEO, eccentricityGEO, ...
    inclinationGEO, raanGEO, argumentOfPeriapsisGEO, trueAnomalyGEO, ...
    "Name", "GEO Sat");

% --- LEO ORBIT ---
% LEO orbital parameters
semiMajorAxisLEO = 7000e3; % Semi-major axis for LEO (Earth radius + altitude)
eccentricityLEO = 0; % Circular orbit
inclinationLEO = 98; % Polar inclination
raanLEO = 0; % Right ascension of the ascending node
argumentOfPeriapsisLEO = 0; % Argument of perigee
trueAnomalyLEO = 0; % Initial true anomaly

% Create LEO satellites (example constellation)
numLEOSatellites = 10; % Number of satellites in the constellation
for i = 0:numLEOSatellites-1
    raanLEO = i * (360 / numLEOSatellites); % Distribute satellites evenly in orbit
    leoSat = satellite(sc, semiMajorAxisLEO, eccentricityLEO, ...
        inclinationLEO, raanLEO, argumentOfPeriapsisLEO, trueAnomalyLEO, ...
        "Name", sprintf("LEO Sat %d", i+1));
end

% --- GROUND STATIONS ---
% Ground station in Bogotá (main uplink)
latitudeBogota = 4.7110;
longitudeBogota = -74.0721;
altitudeBogota = 0;
gsBogota = groundStation(sc, "Name", "Bogota Station", ...
    "Latitude", latitudeBogota, "Longitude", longitudeBogota, "Altitude", altitudeBogota);

% Ground station in Riohacha (uplink for La Guajira)
latitudeRiohacha = 11.5447;
longitudeRiohacha = -72.9075;
altitudeRiohacha = 0;
gsRiohacha = groundStation(sc, "Name", "Riohacha Station", ...
    "Latitude", latitudeRiohacha, "Longitude", longitudeRiohacha, "Altitude", altitudeRiohacha);

% Ground station in Leticia (uplink for the Amazon)
latitudeLeticia = -4.2150;
longitudeLeticia = -69.9406;
altitudeLeticia = 0;
gsLeticia = groundStation(sc, "Name", "Leticia Station", ...
    "Latitude", latitudeLeticia, "Longitude", longitudeLeticia, "Altitude", altitudeLeticia);

% --- VISUALIZATION ---
% Visualize the scenario with satellites and ground stations
satelliteScenarioViewer(sc);

% Display satellite information
disp("Satellites created:");
disp(sc.Satellites);

% Display ground station information
disp("Ground stations:");
disp(sc.GroundStations);
