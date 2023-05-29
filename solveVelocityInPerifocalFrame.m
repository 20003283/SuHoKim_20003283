function velocityInPQW=solveVelocityInPerifocalFrame(a,e,v)

%
% input: semimajor_axis,eccentricity,true_anomaly 3개 스칼라 변수
% output: velocityInPQW
% 각도는 모두 rad 단위

% semimajor_axis=a;
% eccentricity=e;
% true_anomaly=v;
mu=398600; %in perifocal coordinate

a=10000;
e=0.1;
v=60*pi/180;

p=a*(1-e^2);

velocityInPQW=sqrt(mu/p)*[-sin(v);e+cos(v); 0];

end