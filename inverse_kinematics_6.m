% Input vectors
%w = input("Enter the value for w as a vector [w1 w2 w3 w4 w5 w6]: ");
%d = input("Enter the value for d as a vector [d1 d2 d3 d4 ...]: ");
%a = input("Enter the value for a as a vector [a1 a2]: ");

% --- Hardcoded Input Vectors ---
w = [300 100 150 0 0 2];      % Example values for w1 to w6
d = [500 0 0 100];            % Example values for d1, d2, d3, d4
a = [250 150];                % Example values for a1 and a2

% Calculate q2 using Law of Cosines
q2 = acos(((w(1)^2 + w(2)^2 - a(1)^2 - a(2)^2) / (2 * a(1) * a(2))));

% Forward kinematic calculations for two configurations (elbow up/down)
Y = (a(2) * sin(q2) * w(1)) + (a(1) + a(2) * cos(q2)) * w(2);
X = (a(1) + a(2) * cos(q2)) * w(1) - a(2) * sin(q2) * w(2);
q1a = atan2(Y, X);  % Elbow-down solution

Yb = (a(2) * sin(-q2) * w(1)) + (a(1) + a(2) * cos(-q2)) * w(2);
Xb = (a(1) + a(2) * cos(-q2)) * w(1) - a(2) * sin(-q2) * w(2);
q1b = atan2(Yb, Xb);  % Elbow-up solution

% Compute prismatic joint value q3
q3 = d(1) - d(4) - w(3);

% Compute q4 from w6
q4 = pi * log(abs(w(6)));

% Display results
disp("q2 = "); disp(q2);
disp("q1a = "); disp(q1a);
disp("q1b = "); disp(q1b);
disp("q3 = "); disp(q3);
disp("q4 = "); disp(q4);