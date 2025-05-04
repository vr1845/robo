%q - position
%qd - velocity
%qdd = accelaratioon
wpts = [0 45 15 90 45; 90 45 -45 15 90];
[q, qd, qdd, tvec, ppv] = trapveltraj(wpts, 501);

subplot(2,2,1)
plot(tvec, q)
xlabel('t')
ylabel('Position')
legend('X', 'Y')

subplot(2,1,2)
plot(tvec, qd)
xlabel('t')
ylabel('Velocities')
legend('X', 'Y')

%For this exp go to Home on top left select Add-Ons -> Get Add-Ons ->
%Search for Robotics System Toolbox and install