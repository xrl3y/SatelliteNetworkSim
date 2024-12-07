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
argumentOfPeriapsisLEO = 0; % Argumento del perigeo

% Parámetros de la constelación
numPlanesLEO = 20; % Número de planos orbitales
satellitesPerPlane = 10; % Satélites por plano orbital
totalLEOSatellites = numPlanesLEO * satellitesPerPlane; % Total de satélites
planeSeparation = 360 / numPlanesLEO; % Separación entre planos en grados
satelliteSeparation = 360 / satellitesPerPlane; % Separación dentro del plano

% Crear satélites en la constelación escalonada
for plane = 0:numPlanesLEO-1
    raanLEO = plane * planeSeparation; % RAAN para cada plano
    for sat = 0:satellitesPerPlane-1
        trueAnomalyLEO = sat * satelliteSeparation; % Desfase dentro del plano
        leoSat = satellite(sc, semiMajorAxisLEO, eccentricityLEO, ...
            inclinationLEO, raanLEO, argumentOfPeriapsisLEO, trueAnomalyLEO, ...
            "Name", sprintf("LEO Sat %d-%d", plane+1, sat+1));
    end
end

% --- ESTACIONES TERRESTRES ---
% Estación en Bogotá (uplink principal)
latitudeBogota = 4.7110;
longitudeBogota = -74.0721;
altitudeBogota = 0;
gsBogota = groundStation(sc, "Name", "Bogota Station", ...
    "Latitude", latitudeBogota, "Longitude", longitudeBogota, "Altitude", altitudeBogota);

% Estación en Riohacha (uplink para La Guajira)
latitudeRiohacha = 11.535458;
longitudeRiohacha = -72.922254;
altitudeRiohacha = 0;
gsRiohacha = groundStation(sc, "Name", "Riohacha Station", ...
    "Latitude", latitudeRiohacha, "Longitude", longitudeRiohacha, "Altitude", altitudeRiohacha);

% Estación en Leticia (uplink para el Amazonas)
latitudeLeticia = -4.2150;
longitudeLeticia = -69.9406;
altitudeLeticia = 0;
gsLeticia = groundStation(sc, "Name", "Leticia Station", ...
    "Latitude", latitudeLeticia, "Longitude", longitudeLeticia, "Altitude", altitudeLeticia);

% Estación en Mitú (uplink para Vaupés y zonas selváticas)
latitudeMitu = 1.1983;
longitudeMitu = -70.1730;
altitudeMitu = 0;
gsMitu = groundStation(sc, "Name", "Mitu Station", ...
    "Latitude", latitudeMitu, "Longitude", longitudeMitu, "Altitude", altitudeMitu);

% Estación en San Andrés (uplink para el archipiélago)
latitudeSanAndres = 12.5847;
longitudeSanAndres = -81.7006;
altitudeSanAndres = 0;
gsSanAndres = groundStation(sc, "Name", "San Andres Station", ...
    "Latitude", latitudeSanAndres, "Longitude", longitudeSanAndres, "Altitude", altitudeSanAndres);

% Estación en Pasto (uplink para Nariño y sur del país)
latitudePasto = 1.2136;
longitudePasto = -77.2811;
altitudePasto = 0;
gsPasto = groundStation(sc, "Name", "Pasto Station", ...
    "Latitude", latitudePasto, "Longitude", longitudePasto, "Altitude", altitudePasto);

% Estación en Villavicencio (uplink para los Llanos Orientales)
latitudeVillavicencio = 4.1420;
longitudeVillavicencio = -73.6266;
altitudeVillavicencio = 0;
gsVillavicencio = groundStation(sc, "Name", "Villavicencio Station", ...
    "Latitude", latitudeVillavicencio, "Longitude", longitudeVillavicencio, "Altitude", altitudeVillavicencio);

% Estación en Quibdó (uplink para Chocó y zonas del Pacífico)
latitudeQuibdo = 5.6919;
longitudeQuibdo = -76.6584;
altitudeQuibdo = 0;
gsQuibdo = groundStation(sc, "Name", "Quibdo Station", ...
    "Latitude", latitudeQuibdo, "Longitude", longitudeQuibdo, "Altitude", altitudeQuibdo);

% --- Puntos de Download Link (zonas rurales) ---
% Región: La Guajira
latitudeGuajiraDL = 11.709312; 
longitudeGuajiraDL = -72.261161;
altitudeGuajiraDL = 0;
gsGuajiraDL = groundStation(sc, "Name", "Guajira Download Link", ...
    "Latitude", latitudeGuajiraDL, "Longitude", longitudeGuajiraDL, "Altitude", altitudeGuajiraDL);

% Región: Amazonas
latitudeAmazonasDL = -3.7534;
longitudeAmazonasDL = -70.2563;
altitudeAmazonasDL = 0;
gsAmazonasDL = groundStation(sc, "Name", "Amazonas Download Link", ...
    "Latitude", latitudeAmazonasDL, "Longitude", longitudeAmazonasDL, "Altitude", altitudeAmazonasDL);

% Región: Chocó
latitudeChocoDL = 5.3000;
longitudeChocoDL = -76.8000;
altitudeChocoDL = 0;
gsChocoDL = groundStation(sc, "Name", "Choco Download Link", ...
    "Latitude", latitudeChocoDL, "Longitude", longitudeChocoDL, "Altitude", altitudeChocoDL);

% Región: Vaupés
latitudeVaupesDL = -0.8607;
longitudeVaupesDL = -70.9300;
altitudeVaupesDL = 0;
gsVaupesDL = groundStation(sc, "Name", "Vaupes Download Link", ...
    "Latitude", latitudeVaupesDL, "Longitude", longitudeVaupesDL, "Altitude", altitudeVaupesDL);

% Región: Putumayo
latitudePutumayoDL = -1.1520;
longitudePutumayoDL = -76.6500;
altitudePutumayoDL = 0;
gsPutumayoDL = groundStation(sc, "Name", "Putumayo Download Link", ...
    "Latitude", latitudePutumayoDL, "Longitude", longitudePutumayoDL, "Altitude", altitudePutumayoDL);

% Región: Vichada
latitudeVichadaDL = 4.7087;
longitudeVichadaDL = -69.7591;
altitudeVichadaDL = 0;
gsVichadaDL = groundStation(sc, "Name", "Vichada Download Link", ...
    "Latitude", latitudeVichadaDL, "Longitude", longitudeVichadaDL, "Altitude", altitudeVichadaDL);

% Región: Guainía
latitudeGuainiaDL = 2.5701;
longitudeGuainiaDL = -68.3000;
altitudeGuainiaDL = 0;
gsGuainiaDL = groundStation(sc, "Name", "Guainia Download Link", ...
    "Latitude", latitudeGuainiaDL, "Longitude", longitudeGuainiaDL, "Altitude", altitudeGuainiaDL);



% --- VISUALIZACIÓN ---
% Visualizar el escenario con satélites y estaciones
satelliteScenarioViewer(sc);

% Mostrar información de los satélites
disp("Satélites creados:");
disp(sc.Satellites);

% Mostrar información de las estaciones terrestres
disp("Estaciones terrestres:");
disp(sc.GroundStations);
