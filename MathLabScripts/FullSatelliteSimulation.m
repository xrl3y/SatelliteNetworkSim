% Create satellite communication scenario
sc = satelliteScenario;

% General parameters
simulationDuration = hours(24); % Simulation duration
sc.StopTime = datetime("now") + simulationDuration;

% --- GEO ORBIT ---
% GEO orbital parameters
semiMajorAxisGEO = 42164e3; % GEO semi-major axis (Earth radius + altitude)
eccentricityGEO = 0; % Circular orbit
inclinationGEO = 0; % Equatorial orbit
raanGEO = 0; % Right Ascension of the Ascending Node
argumentOfPeriapsisGEO = 0; % Argument of periapsis
trueAnomalyGEO = 0; % Initial true anomaly

% Create satellite in GEO
geoSat = satellite(sc, semiMajorAxisGEO, eccentricityGEO, ...
    inclinationGEO, raanGEO, argumentOfPeriapsisGEO, trueAnomalyGEO, ...
    "Name", "GEO Sat");

% --- LEO ORBIT ---
% LEO orbital parameters
semiMajorAxisLEO = 7000e3; % LEO semi-major axis (Earth radius + altitude)
eccentricityLEO = 0; % Circular orbit
inclinationLEO = 98; % Polar inclination
argumentOfPeriapsisLEO = 0; % Argument of periapsis

% Constellation parameters
numPlanesLEO = 20; % Number of orbital planes
satellitesPerPlane = 10; % Satellites per orbital plane
totalLEOSatellites = numPlanesLEO * satellitesPerPlane; % Total satellites
planeSeparation = 360 / numPlanesLEO; % Plane separation in degrees
satelliteSeparation = 360 / satellitesPerPlane; % Satellite separation within the plane

% Create satellites in stepped constellation
for plane = 0:numPlanesLEO-1
    raanLEO = plane * planeSeparation; % RAAN for each plane
    for sat = 0:satellitesPerPlane-1
        trueAnomalyLEO = sat * satelliteSeparation; % Offset within the plane
        leoSat = satellite(sc, semiMajorAxisLEO, eccentricityLEO, ...
            inclinationLEO, raanLEO, argumentOfPeriapsisLEO, trueAnomalyLEO, ...
            "Name", sprintf("LEO Sat %d-%d", plane+1, sat+1));
    end
end

% --- GROUND STATIONS ---
% Station in Bogotá (main uplink)
latitudeBogota = 4.7110;
longitudeBogota = -74.0721;
altitudeBogota = 0;
gsBogota = groundStation(sc, "Name", "Bogota Station", ...
    "Latitude", latitudeBogota, "Longitude", longitudeBogota, "Altitude", altitudeBogota);

% Station in Riohacha (uplink for La Guajira)
latitudeRiohacha = 11.535458;
longitudeRiohacha = -72.922254;
altitudeRiohacha = 0;
gsRiohacha = groundStation(sc, "Name", "Riohacha Station", ...
    "Latitude", latitudeRiohacha, "Longitude", longitudeRiohacha, "Altitude", altitudeRiohacha);

% Station in Leticia (uplink for Amazonas)
latitudeLeticia = -4.2150;
longitudeLeticia = -69.9406;
altitudeLeticia = 0;
gsLeticia = groundStation(sc, "Name", "Leticia Station", ...
    "Latitude", latitudeLeticia, "Longitude", longitudeLeticia, "Altitude", altitudeLeticia);

% Station in Mitú (uplink for Vaupés and jungle areas)
latitudeMitu = 1.1983;
longitudeMitu = -70.1730;
altitudeMitu = 0;
gsMitu = groundStation(sc, "Name", "Mitu Station", ...
    "Latitude", latitudeMitu, "Longitude", longitudeMitu, "Altitude", altitudeMitu);

% Station in San Andrés (uplink for the archipelago)
latitudeSanAndres = 12.5847;
longitudeSanAndres = -81.7006;
altitudeSanAndres = 0;
gsSanAndres = groundStation(sc, "Name", "San Andres Station", ...
    "Latitude", latitudeSanAndres, "Longitude", longitudeSanAndres, "Altitude", altitudeSanAndres);

% Station in Pasto (uplink for Nariño and southern regions)
latitudePasto = 1.2136;
longitudePasto = -77.2811;
altitudePasto = 0;
gsPasto = groundStation(sc, "Name", "Pasto Station", ...
    "Latitude", latitudePasto, "Longitude", longitudePasto, "Altitude", altitudePasto);

% Station in Villavicencio (uplink for Llanos Orientales)
latitudeVillavicencio = 4.1420;
longitudeVillavicencio = -73.6266;
altitudeVillavicencio = 0;
gsVillavicencio = groundStation(sc, "Name", "Villavicencio Station", ...
    "Latitude", latitudeVillavicencio, "Longitude", longitudeVillavicencio, "Altitude", altitudeVillavicencio);

% Station in Quibdó (uplink for Chocó and Pacific region)
latitudeQuibdo = 5.6919;
longitudeQuibdo = -76.6584;
altitudeQuibdo = 0;
gsQuibdo = groundStation(sc, "Name", "Quibdo Station", ...
    "Latitude", latitudeQuibdo, "Longitude", longitudeQuibdo, "Altitude", altitudeQuibdo);

% --- Download Link Points (rural areas) ---
% Region: La Guajira
latitudeGuajiraDL = 11.709312; 
longitudeGuajiraDL = -72.261161;
altitudeGuajiraDL = 0;
gsGuajiraDL = groundStation(sc, "Name", "Guajira Download Link", ...
    "Latitude", latitudeGuajiraDL, "Longitude", longitudeGuajiraDL, "Altitude", altitudeGuajiraDL);

% Region: Amazonas
latitudeAmazonasDL = -3.7534;
longitudeAmazonasDL = -70.2563;
altitudeAmazonasDL = 0;
gsAmazonasDL = groundStation(sc, "Name", "Amazonas Download Link", ...
    "Latitude", latitudeAmazonasDL, "Longitude", longitudeAmazonasDL, "Altitude", altitudeAmazonasDL);

% Region: Chocó
latitudeChocoDL = 5.3000;
longitudeChocoDL = -76.8000;
altitudeChocoDL = 0;
gsChocoDL = groundStation(sc, "Name", "Choco Download Link", ...
    "Latitude", latitudeChocoDL, "Longitude", longitudeChocoDL, "Altitude", altitudeChocoDL);

% Region: Vaupés
latitudeVaupesDL = -0.8607;
longitudeVaupesDL = -70.9300;
altitudeVaupesDL = 0;
gsVaupesDL = groundStation(sc, "Name", "Vaupes Download Link", ...
    "Latitude", latitudeVaupesDL, "Longitude", longitudeVaupesDL, "Altitude", altitudeVaupesDL);

% Region: Putumayo
latitudePutumayoDL = -1.1520;
longitudePutumayoDL = -76.6500;
altitudePutumayoDL = 0;
gsPutumayoDL = groundStation(sc, "Name", "Putumayo Download Link", ...
    "Latitude", latitudePutumayoDL, "Longitude", longitudePutumayoDL, "Altitude", altitudePutumayoDL);

% Region: Vichada
latitudeVichadaDL = 4.7087;
longitudeVichadaDL = -69.7591;
altitudeVichadaDL = 0;
gsVichadaDL = groundStation(sc, "Name", "Vichada Download Link", ...
    "Latitude", latitudeVichadaDL, "Longitude", longitudeVichadaDL, "Altitude", altitudeVichadaDL);

% Region: Guainía
latitudeGuainiaDL = 2.5701;
longitudeGuainiaDL = -68.3000;
altitudeGuainiaDL = 0;
gsGuainiaDL = groundStation(sc, "Name", "Guainia Download Link", ...
    "Latitude", latitudeGuainiaDL, "Longitude", longitudeGuainiaDL, "Altitude", altitudeGuainiaDL);

% --- VISUALIZATION ---
% Visualize the scenario with satellites and stations
satelliteScenarioViewer(sc);

% Display satellite information
disp("Satellites created:");
disp(sc.Satellites);

% Display ground station information
disp("Ground stations:");
disp(sc.GroundStations);

