function DCM = ECI2ECEF_DCM(time)

time = [2000, 6, 28, 12, 0, 0];  

    year = time(1);
    month = time(2);
    day = time(3);
    hour = time(4);
    minute = time(5);
    second = time(6);
    
    datetimeValue = datetime(year, month, day, hour, minute, second);

    JD = juliandate(datetimeValue);
    
    T = (JD - 2451545.0) / 36525.0;
    
    theta = 2 * pi * mod(0.779057273264 + 1.00273781191135448 * (JD - 2451545.0), 1);
    
    DCM = [cos(theta) sin(theta) 0;
           -sin(theta) cos(theta) 0;
           0     0    1] ;
end
