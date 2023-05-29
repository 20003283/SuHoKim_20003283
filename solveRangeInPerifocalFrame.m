function rangeInPQW= solveRangeInPerifocalFrame(semimajor_axis,eccentricity,true_anomaly)

%
% input: semimajor_axis,eccentricity,true_anomaly 3개 스칼라 변수
% output: rangeInPQW

mu=398600; %in perifocal coordinate
semimajor_axis=10000;
eccentricity=0.1;
true_anomaly=60;

r= semimajor_axis*(1-eccentricity^2)/(1+eccentricity*cos(true_anomaly));

rangeInPQW=[r*cos(true_anomaly); r*sin(true_anomaly); 0];

end


