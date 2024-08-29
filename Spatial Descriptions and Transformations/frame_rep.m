function animate_sequential_transformation()
    % Define the colors for the frames and translation vector
    colorA = 'r'; % Frame A color
    colorB = 'b'; % Frame B color
    vectorColor = 'g'; % Translation vector color

    % Initialize figure
    figure;
    axis equal;
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    view(3);

    % Plot initial frame {A}
    hold on;
    plot_frame(eye(3), [0, 0, 0], colorA); % Frame A (fixed)

    % Define translation vectors and rotation angles
    translations = [2, 1, 0;  % Translation for first transformation
                    0, 2, 1;  % Translation for second transformation
                    1, 0, 2]; % Translation for third transformation

    angles = [pi/6, pi/4, pi/3]; % Rotation angles (30°, 45°, 60°)
    num_steps = 100; % Number of steps for smooth animation

    % Initial position and orientation of frame {B}
    R_B = eye(3);
    pos_B = [0, 0, 0];

    % Perform the three transformations
    for i = 1:3
        % Animate translation
        for t = linspace(0, 1, num_steps)
            pos_t = pos_B + t * translations(i, :);
            hB = plot_frame(R_B, pos_t, colorB);
            % Plot the translation vector as a line
            plot3([pos_B(1), pos_t(1)], [pos_B(2), pos_t(2)], [pos_B(3), pos_t(3)], vectorColor, 'LineWidth', 2);
            pause(0.01); % Adjust pause for smoother animation
            delete(hB); % Remove previous frame to animate smoothly
        end
        pos_B = pos_t; % Update position after translation

        % Animate rotation
        for t = linspace(0, 1, num_steps)
            switch i
                case 1
                    R_t = rotx(t * angles(i)) * R_B; % Rotation about X-axis
                case 2
                    R_t = roty(t * angles(i)) * R_B; % Rotation about Y-axis
                case 3
                    R_t = rotz(t * angles(i)) * R_B; % Rotation about Z-axis
            end
            hB = plot_frame(R_t, pos_B, colorB);
            pause(0.01); % Adjust pause for smoother animation
            delete(hB); % Remove previous frame to animate smoothly
        end
        R_B = R_t; % Update rotation matrix after rotation

        % Plot final frame {B} for the current transformation
        plot_frame(R_B, pos_B, colorB);
        pause(1); % Pause to visualize before next transformation
    end

    hold off;
end

function h = plot_frame(R, origin, color)
    % Plot a 3D coordinate frame
    X = R(:, 1);
    Y = R(:, 2);
    Z = R(:, 3);
    h(1) = quiver3(origin(1), origin(2), origin(3), X(1), X(2), X(3), color, 'LineWidth', 2);
    h(2) = quiver3(origin(1), origin(2), origin(3), Y(1), Y(2), Y(3), color, 'LineWidth', 2);
    h(3) = quiver3(origin(1), origin(2), origin(3), Z(1), Z(2), Z(3), color, 'LineWidth', 2);
end

function R = rotx(angle)
    % Rotation matrix around the X-axis
    R = [1, 0, 0;
         0, cos(angle), -sin(angle);
         0, sin(angle), cos(angle)];
end

function R = roty(angle)
    % Rotation matrix around the Y-axis
    R = [cos(angle), 0, sin(angle);
         0, 1, 0;
         -sin(angle), 0, cos(angle)];
end

function R = rotz(angle)
    % Rotation matrix around the Z-axis
    R = [cos(angle), -sin(angle), 0;
         sin(angle), cos(angle), 0;
         0, 0, 1];
end
