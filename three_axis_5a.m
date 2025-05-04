% 3-axis code
clc; clear; close all;

% Link lengths
a1 = 1;
a2 = 1.5;
a3 = 1;

% Joint angles (in radians)
t1 = pi/3;
t2 = pi/12;
t3 = pi/18;

% Forward kinematics calculations
a1x = a1 * cos(t1);
a1y = a1 * sin(t1);
a2x = a1x + a2 * cos(t1 + t2);
a2y = a1y + a2 * sin(t1 + t2);
a3x = a2x + a3 * cos(t1 + t2 + t3);
a3y = a2y + a3 * sin(t1 + t2 + t3);

% Coordinate axes
xx = [-5, 5];
xy = [0, 0];
yx = [0, 0];
yy = [-5, 5];

% Link positions
link1x = [0, a1x];
link1y = [0, a1y];
link2x = [a1x, a2x];
link2y = [a1y, a2y];
link3x = [a2x, a3x];
link3y = [a2y, a3y];

% Plot the robotic arm
figure;
hold on;
grid on;
axis equal;
plot(xx, xy, 'r', yx, yy, 'g'); % Plot reference axes
plot(link1x, link1y, 'b', 'LineWidth', 2); % Link 1
plot(link2x, link2y, 'c', 'LineWidth', 2); % Link 2
plot(link3x, link3y, 'm', 'LineWidth', 2); % Link 3

% Scatter joint and end-effector positions
scatter([0, a1x, a2x, a3x], [0, a1y, a2y, a3y], 50, 'filled', 'k');

% Label points
text(0, 0, ' O (0,0)', 'FontSize', 10, 'Color', 'k', 'FontWeight', 'bold');
text(a1x, a1y, sprintf(' A (%.2f, %.2f)', a1x, a1y), 'FontSize', 10, 'Color', 'b', 'FontWeight', 'bold');
text(a2x, a2y, sprintf(' B (%.2f, %.2f)', a2x, a2y), 'FontSize', 10, 'Color', 'c', 'FontWeight', 'bold');
text(a3x, a3y, sprintf(' P (%.2f, %.2f)', a3x, a3y), 'FontSize', 10, 'Color', 'm', 'FontWeight', 'bold');

% Titles and labels
title('3-Axis Robotic Arm Forward Kinematics');
xlabel('X-axis');
ylabel('Y-axis');
hold off;