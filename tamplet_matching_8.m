% Code 1 (Performance Index Method)
% Matches the manual's brute-force approach (Page 43)
i = [2 1 0 0 3; 
     0 0 5 0 0; 
     0 4 0 6 0; 
     1 0 5 0 0]; 
t = [0 4 0; 
     3 0 5; 
     0 4 0]; 
P = [0 0 0; 0 0 0]; 
m = 5; n = 4; m0 = 3; n0 = 3; 
for k = 1:n0 
    for j = 1:m0 
        for x = 1:n-n0+1 
            for y = 1:m-m0+1
                P(x, y) = P(x, y) + abs(i(k + x - 1, j + y - 1) - t(k, j)); 
            end 
        end 
    end 
end 
disp("P = "); disp(P); 
Y = min(P(:)); 
disp("Minimum Performance Index: "); disp(Y); 
[r, c] = size(P); 
for i = 1:r 
    for j = 1:c 
        if P(i, j) == Y 
            disp("Location"); disp([i-1, j-1]); 
        end 
    end 
end 