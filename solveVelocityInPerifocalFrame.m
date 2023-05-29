function velocityInPQW=solveVelocityInPerifocalFrame(semimajor_axis,eccentricity,true_anomaly)

%
% input: semimajor_axis,eccentricity,true_anomaly 3개 스칼라 변수
% output: velocityInPQW

mu=398600; %in perifocal coordinate
semimajor_axis=10000;
eccentricity=0.1;
true_anomaly=60;

velocityInPQW=sqrt(mu/semimajor_axis)*[-sin(true_anomaly); eccentricity+cos(true_anomaly); 0];

end