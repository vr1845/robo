% --- Hardcoded Inputs ---
axis_type = 1;  % 1 for mobile, 2 for fixed
frame_order = 'ZYX';
angles_deg = [30, 45, 60];  % in degrees
inp_point = [1, 2, 3];  % 3D point

% --- Manual Input (commented) ---
% axis_type = input('Select axis type: 1 for mobile, 2 for fixed: ');
% frame_order = upper(input('Enter the rotation order (e.g., "XYZ", "ZYX", "YPR"): ', 's'));
% angles_deg = input('Enter rotation angles in degrees as a vector [theta1, theta2, theta3]: ');
% inp_point = input('Enter a 3D point as a vector [x, y, z]: ');

% --- Computation ---
angles_rad = deg2rad(angles_deg);

Rx = @(theta) [1, 0, 0;
               0, cos(theta), -sin(theta);
               0, sin(theta), cos(theta)];

Ry = @(theta) [cos(theta), 0, sin(theta);
               0, 1, 0;
               -sin(theta), 0, cos(theta)];

Rz = @(theta) [cos(theta), -sin(theta), 0;
               sin(theta), cos(theta), 0;
               0, 0, 1];

R = eye(3);

if axis_type == 1  % Mobile axes
    for i = 1:length(frame_order)
        if frame_order(i) == 'X'
            R = Rx(angles_rad(i)) * R;
        elseif frame_order(i) == 'Y'
            R = Ry(angles_rad(i)) * R;
        elseif frame_order(i) == 'Z'
            R = Rz(angles_rad(i)) * R;
        else
            error('Invalid rotation axis specified. Use X, Y, or Z.');
        end
    end
elseif axis_type == 2  % Fixed axes
    for i = length(frame_order):-1:1
        if frame_order(i) == 'X'
            R = Rx(angles_rad(i)) * R;
        elseif frame_order(i) == 'Y'
            R = Ry(angles_rad(i)) * R;
        elseif frame_order(i) == 'Z'
            R = Rz(angles_rad(i)) * R;
        else
            error('Invalid rotation axis specified. Use X, Y, or Z.');
        end
    end
else
    error('Invalid axis type. Use 1 for mobile or 2 for fixed.');
end

disp('Composite Rotation Matrix:');
disp(R);

inp_point = reshape(inp_point, 3, 1);
final_point = R * inp_point;

disp('Final Point after rotation:');
disp(final_point);
