% Crear escenario de comunicación satelital
sc = satelliteScenario;

% Parámetros generales
simulationDuration = hours(24); % Duración de la simulación
sc.StopTime = datetime("now") + simulationDuration;

% --- ÓRBITA GEO ---
% Parámetros orbitales GEO
semiMajorAxisGEO = 42164e3; % Semieje mayor GEO (radio de la Tierra + altitud)
eccentricityGEO = 0; % Órbita circular
inclinationGEO = 0; % Órbita ecuatorial
raanGEO = 0; % Ascensión recta del nodo ascendente
argumentOfPeriapsisGEO = 0; % Argumento del perigeo
trueAnomalyGEO = 0; % Anomalía verdadera inicial

% Crear satélite en GEO
geoSat = satellite(sc, semiMajorAxisGEO, eccentricityGEO, ...
    inclinationGEO, raanGEO, argumentOfPeriapsisGEO, trueAnomalyGEO, ...
    "Name", "GEO Sat");

% --- ÓRBITA LEO ---
% Parámetros orbitales LEO
semiMajorAxisLEO = 7000e3; % Semieje mayor LEO (radio de la Tierra + altitud)
eccentricityLEO = 0; % Órbita circular
inclinationLEO = 98; % Inclinación polar
raanLEO = 0; % Ascensión recta del nodo ascendente
argumentOfPeriapsisLEO = 0; % Argumento del perigeo
trueAnomalyLEO = 0; % Anomalía verdadera inicial

% Crear satélites en LEO (constelación de ejemplo)
numLEOSatellites = 10; % Número de satélites en la constelación
for i = 0:numLEOSatellites-1
    raanLEO = i * (360 / numLEOSatellites); % Distribuir en órbitas uniformemente
    leoSat = satellite(sc, semiMajorAxisLEO, eccentricityLEO, ...
        inclinationLEO, raanLEO, argumentOfPeriapsisLEO, trueAnomalyLEO, ...
        "Name", sprintf("LEO Sat %d", i+1));
end

% --- ESTACIONES TERRESTRES ---
% Estación en Bogotá (uplink principal)
latitudeBogota = 4.7110;
longitudeBogota = -74.0721;
altitudeBogota = 0;
gsBogota = groundStation(sc, "Name", "Bogota Station", ...
    "Latitude", latitudeBogota, "Longitude", longitudeBogota, "Altitude", altitudeBogota);

% Estación en Riohacha (uplink para La Guajira)
latitudeRiohacha = 11.5447;
longitudeRiohacha = -72.9075;
altitudeRiohacha = 0;
gsRiohacha = groundStation(sc, "Name", "Riohacha Station", ...
    "Latitude", latitudeRiohacha, "Longitude", longitudeRiohacha, "Altitude", altitudeRiohacha);

% Estación en Leticia (uplink para el Amazonas)
latitudeLeticia = -4.2150;
longitudeLeticia = -69.9406;
altitudeLeticia = 0;
gsLeticia = groundStation(sc, "Name", "Leticia Station", ...
    "Latitude", latitudeLeticia, "Longitude", longitudeLeticia, "Altitude", altitudeLeticia);

% --- VISUALIZACIÓN ---
% Visualizar el escenario con satélites y estaciones
satelliteScenarioViewer(sc);

% Mostrar información de los satélites
disp("Satélites creados:");
disp(sc.Satellites);

% Mostrar información de las estaciones terrestres
disp("Estaciones terrestres:");
disp(sc.GroundStations);
