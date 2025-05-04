original_point = [1, 1, 1];  % idhar points if change krna karo

translation = [2, 3, 0];  % Translation according to quest

% z ka rotation angle
theta = 45;
theta = deg2rad(theta);  % Convert to radians

% Rz ka formula
Rz = [cos(theta), -sin(theta), 0;
      sin(theta),  cos(theta), 0;
      0,           0,          1];

% Apply the translation
translated_point = original_point + translation;

% Apply the rotation (first translate, then rotate)
final_point = (Rz * translated_point')';

% Display the results
disp('Original Point:');
disp(original_point);
disp('Translated Point:');
disp(translated_point);
disp('Final Point after Rotation:');
disp(final_point);