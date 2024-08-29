% User Input for x, y, z coordinates
x = input('Enter the x-coordinate: ');
y = input('Enter the y-coordinate: ');
z = input('Enter the z-coordinate: ');

% Create arrays for plotting the original vector P
xa = [0 x x x];
ya = [0 0 y y];
za = [0 0 0 z];

% Plot the original vector P
plot3(xa, ya, za, '--r', 'LineWidth', 1.5);
hold on;

% Mark the end point of the vector P
plot3(x, y, z, 'kO', 'LineWidth', 2);
hold on;

% Calculate the magnitude of P
PM = sqrt(x^2 + y^2 + z^2); % magnitude of P

% Define the start and end points for the unit vector P_hat
p0 = [0 0 0]; 
p1 = [x/PM, y/PM, z/PM];

% Call the vectarrow function to draw the vector
vectarrow(p0, p1); 
hold on;

% Create arrays for plotting a line from the unit vector end point to the original vector end point
XC = [x/PM, x];
YC = [y/PM, y];
ZC = [z/PM, z];

% Plot this line
plot3(XC, YC, ZC, '--k', 'LineWidth', 0.5);
hold on;

% Final Adjustments
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;
axis equal;
hold off;

% --- Function Definitions ---

function vectarrow(p0, p1)
    % Function to draw a vector arrow from p0 to p1
    quiver3(p0(1), p0(2), p0(3), p1(1)-p0(1), p1(2)-p0(2), p1(3)-p0(3), ...
            'AutoScale', 'off', 'LineWidth', 2, 'MaxHeadSize', 0.5);
end
