% 4-Axis Direct Kinematics (manual input active, hardcoded input commented)

% --- Manual Inputs ---
%q = input("Enter the values for joint variables [q1 q2 q3 q4]: ");
%d = input("Enter the values for joint distance [d1 d2 d3 d4]: ");
%a = input("Enter the values for link distance [a1 a2 a3 a4]: ");
%alpha = input("Enter the values for link twist angle [α1 α2 α3 α4]: ");
%theta = input("Enter the values for Theta [θ1 θ2 θ3 θ4]: ");

% --- Hardcoded Example Inputs (Commented Out) ---
 q = [pi/4, -pi/4, 120, pi/2];  
 d = [877, 0, q(3), 200];       
 a = [425, 375, 0, 0];          
 alpha = [pi, 0, 0, 0];         
 theta = [pi/4, -pi/3, 0, pi/2];

% Transformation Matrix T1
T1 = [cos(theta(1)), -cos(alpha(1))*sin(theta(1)), sin(alpha(1))*sin(theta(1)), a(1)*cos(theta(1));
      sin(theta(1)),  cos(alpha(1))*cos(theta(1)), -sin(alpha(1))*cos(theta(1)), a(1)*sin(theta(1));
      0,              sin(alpha(1)),               cos(alpha(1)),               d(1);
      0,              0,                           0,                           1];

% Transformation Matrix T2
T2 = [cos(theta(2)), -cos(alpha(2))*sin(theta(2)), sin(alpha(2))*sin(theta(2)), a(2)*cos(theta(2));
      sin(theta(2)),  cos(alpha(2))*cos(theta(2)), -sin(alpha(2))*cos(theta(2)), a(2)*sin(theta(2));
      0,              sin(alpha(2)),               cos(alpha(2)),               d(2);
      0,              0,                           0,                           1];

% Transformation Matrix T3
T3 = [cos(theta(3)), -cos(alpha(3))*sin(theta(3)), sin(alpha(3))*sin(theta(3)), a(3)*cos(theta(3));
      sin(theta(3)),  cos(alpha(3))*cos(theta(3)), -sin(alpha(3))*cos(theta(3)), a(3)*sin(theta(3));
      0,              sin(alpha(3)),               cos(alpha(3)),               d(3);
      0,              0,                           0,                           1];

% Transformation Matrix T4
T4 = [cos(theta(4)), -cos(alpha(4))*sin(theta(4)), sin(alpha(4))*sin(theta(4)), a(4)*cos(theta(4));
      sin(theta(4)),  cos(alpha(4))*cos(theta(4)), -sin(alpha(4))*cos(theta(4)), a(4)*sin(theta(4));
      0,              sin(alpha(4)),               cos(alpha(4)),               d(4);
      0,              0,                           0,                           1];

% Composite Transformation Matrix
T = T1 * T2 * T3 * T4;

% End-effector Position
Px = T(1,4);
Py = T(2,4);
Pz = T(3,4);

% Display the result
fprintf('\nEnd Effector Position:\nPx = %.2f\nPy = %.2f\nPz = %.2f\n', Px, Py, Pz);
