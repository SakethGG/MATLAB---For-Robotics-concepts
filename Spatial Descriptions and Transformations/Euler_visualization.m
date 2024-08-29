% Define the Euler rotation sequence and initial angles
rotation_order = input('Enter the rotation order (e.g., ZYX): ', 's');
alpha = input('Enter the first rotation angle (in degrees): ');
beta = input('Enter the second rotation angle (in degrees): ');
gamma = input('Enter the third rotation angle (in degrees): ');

% Convert angles to radians
alpha = deg2rad(alpha);
beta = deg2rad(beta);
gamma = deg2rad(gamma);

% Define rotation matrices
R_x = @(theta) [1, 0, 0; 0, cos(theta), -sin(theta); 0, sin(theta), cos(theta)];
R_y = @(theta) [cos(theta), 0, sin(theta); 0, 1, 0; -sin(theta), 0, cos(theta)];
R_z = @(theta) [cos(theta), -sin(theta), 0; sin(theta), cos(theta), 0; 0, 0, 1];

% Initialize identity matrix
R = eye(3);

% Plot initial coordinate frame
figure;
axis([-2 2 -2 2 -2 2]);
grid on;
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');

% Plot the fixed coordinate frame (stationary)
plot_axes(eye(3), 'b', 'Fixed', 'Xa', 'Ya', 'Za'); % Fixed frame in blue

% Initial plot for rotating frame
plot_axes(R, 'k', 'Initial', 'Xb', 'Yb', 'Zb');

% Rotation sequence
for i = 1:length(rotation_order)
    switch rotation_order(i)
        case 'X'
            angles = linspace(0, alpha, 100);
            for angle = angles
                R_step = R_x(angle);
                R_new = R * R_step;
                % Clear previous plots
                cla;
                hold on;
                % Plot fixed coordinate frame
                plot_axes(eye(3), 'b', 'Fixed', 'Xa', 'Ya', 'Za'); % Fixed frame in blue
                % Plot updated rotating coordinate frame
                plot_axes(R_new, 'r', 'Rotated', 'Xb', 'Yb', 'Zb');
                pause(0.01); % Decrease pause duration for faster animation
            end
            R = R_new; % Update the total rotation matrix
        case 'Y'
            angles = linspace(0, beta, 100);
            for angle = angles
                R_step = R_y(angle);
                R_new = R * R_step;
                % Clear previous plots
                cla;
                hold on;
                % Plot fixed coordinate frame
                plot_axes(eye(3), 'b', 'Fixed', 'Xa', 'Ya', 'Za'); % Fixed frame in blue
                % Plot updated rotating coordinate frame
                plot_axes(R_new, 'g', 'Rotated', 'Xb', 'Yb', 'Zb');
                pause(0.01); % Decrease pause duration for faster animation
            end
            R = R_new; % Update the total rotation matrix
        case 'Z'
            angles = linspace(0, gamma, 100);
            for angle = angles
                R_step = R_z(angle);
                R_new = R * R_step;
                % Clear previous plots
                cla;
                hold on;
                % Plot fixed coordinate frame
                plot_axes(eye(3), 'b', 'Fixed', 'Xa', 'Ya', 'Za'); % Fixed frame in blue
                % Plot updated rotating coordinate frame
                plot_axes(R_new, 'm', 'Rotated', 'Xb', 'Yb', 'Zb');
                pause(0.01); % Decrease pause duration for faster animation
            end
            R = R_new; % Update the total rotation matrix
    end
end

hold off;

% Function to plot coordinate axes with arrowheads and labels
function plot_axes(R, color, label, X_label, Y_label, Z_label)
    % Define the original axes
    orig_axes = [1 0 0; 0 1 0; 0 0 1];
    % Apply rotation
    rotated_axes = (R * orig_axes')';
    % Arrowhead length
    arrow_length = 1.0;
    
    % Plot X-axis
    quiver3(0, 0, 0, rotated_axes(1,1), rotated_axes(1,2), rotated_axes(1,3), ...
        'Color', color, 'LineWidth', 2, 'MaxHeadSize', 1.5, 'DisplayName', [label, ' X']);
    % Plot Y-axis
    quiver3(0, 0, 0, rotated_axes(2,1), rotated_axes(2,2), rotated_axes(2,3), ...
        'Color', color, 'LineWidth', 2, 'MaxHeadSize', 1.5, 'DisplayName', [label, ' Y']);
    % Plot Z-axis
    quiver3(0, 0, 0, rotated_axes(3,1), rotated_axes(3,2), rotated_axes(3,3), ...
        'Color', color, 'LineWidth', 2, 'MaxHeadSize', 1.5, 'DisplayName', [label, ' Z']);
    
    % Label axes
    text(rotated_axes(1,1) * 1.1, rotated_axes(1,2) * 1.1, rotated_axes(1,3) * 1.1, ...
        X_label, 'Color', color, 'FontWeight', 'bold');
    text(rotated_axes(2,1) * 1.1, rotated_axes(2,2) * 1.1, rotated_axes(2,3) * 1.1, ...
        Y_label, 'Color', color, 'FontWeight', 'bold');
    text(rotated_axes(3,1) * 1.1, rotated_axes(3,2) * 1.1, rotated_axes(3,3) * 1.1, ...
        Z_label, 'Color', color, 'FontWeight', 'bold');
end
