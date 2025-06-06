clear;
p = [1; 2; 3];
rotation_angle = 90;
theta = deg2rad(rotation_angle);
Rz = [cos(theta), -sin(theta), 0;
      sin(theta),  cos(theta), 0;
      0,           0,          1];
disp('Z-Axis Rotation matrix');
disp(Rz);
transformed_point = Rz * p;
disp('original point');
disp(p);
disp('Transformed point');
disp(transformed_point);