% Parameter
a = 4.2164e7;    
i = 0.6126;    
omega = -1.5565;    
M0 = 0.4411;   
OMEGA = 1.6873;   

% Date
start_date = datetime(2023, 5, 9);   
end_date = start_date + days(1);    
time = start_date:hours(1):end_date;

% location
n = sqrt(398600.4418 / a^3);    
dt = hours(1);
t = hours(0):dt:end_date-start_date;
M = M0 + n*t;    
E = 2.7;
nu = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(E / 2));   %true anomaly
r = a * (1 - e^2) ./ (1 + e*cos(nu));   
X = r .* (cos(omega+nu).*cos(OMEGA) - sin(omega+nu).*sin(OMEGA).*cos(i));
Y = r .* (cos(omega+nu).*sin(OMEGA) + sin(omega+nu).*cos(OMEGA).*cos(i));
Z = r .* (sin(omega+nu).*sin(i));

% Satellite Orbit
figure;
plot3(X, Y, Z, 'b');
hold on;
plot3(X(1), Y(1), Z(1), 'ro');    % inital point
plot3(X(end), Y(end), Z(end), 'go');    % final point
plot3(X, Y, Z, 'b-');    
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Satellite Orbit');

% Ground track
figure;
earth_radius = 6371;    % earth's radius
latitude = asind(Z ./ sqrt(X.^2 + Y.^2 + Z.^2));    % latitude
longitude = atan2d(Y, X);    % longitude
plot(longitude, latitude, 'b');
hold on;
plot(longitude(1), latitude(1), 'ro');   
plot(longitude(end), latitude(end), 'go');    
plot(longitude, latitude, 'b-');  
axis([-180 180 -90 90]);
xlabel('Longitude');
ylabel('Latitude');
title('Ground Track');

% Skyplot
figure;
polarplot(deg2rad(longitude), 90 - latitude, 'b.');
hold on;
polarplot(deg2rad(longitude(1)), 90 - latitude(1), 'ro');    
polarplot(deg2rad(longitude(end)), 90 - latitude(end), 'go');   
polarplot(deg2rad(longitude), 90 - latitude, 'b-');    
thetalim([0 360]);
rticks(0:15:90);
title('Skyplot');


