function C= PQW2ECI(arg_prg,inc_angle,RAAN)

% C: rotation matrix
% input: arg_png,inc_angle,RAAN
% output: rotation matrix(3-by-3)
% 각도는 모두 rad 단위

%
arg_prg= deg2rad(arg_prg);
inc_angle=deg2rad(inc_angle);
RAAN=deg2rad(RAAN);

%
R3= [ cos(-RAAN) sin(-RAAN) 0; -sin(RAAN) cos(-RAAN) 0; 0 0 1];
R1= [ 1 0 0; 0 cos(-inc_angle) sin(-inc_angle); 0 -sin(-inc_angle) cos(-inc_angle)];
R3_dot= [ cos(-arg_prg) sin(-arg_prg) 0; -sin(-arg_prg) cos(-arg_prg) 0; 0 0 1];

C=(R3*R1*R3_dot)';
