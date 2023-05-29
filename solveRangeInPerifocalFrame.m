function rangeInPQW= solveRangeInPerifocalFrame(a,e,v)

%
% input: semimajor_axis,eccentricity,true_anomaly 3개 스칼라 변수
% output: rangeInPQW
% 각도는 모두 rad 단위

% semimajor_axis=a;
% eccentricity=e;
% true_anomaly=v;

a=10000;
e=0.1;
v=60*pi/180;

r= a*(1-e^2)/(1+e*cos(v));

rangeInPQW=[r*cos(v); r*sin(v); 0];

end


