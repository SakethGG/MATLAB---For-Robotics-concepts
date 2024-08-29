%%%% vector representation in 3D space%%%%%%%

%get user inputs
origin = input('Enter [x,y,z] for origin(in same format): ');
start_point = input('Enter [a1,b1,c1] for starting point of vectpr: ');
end_point = input('Enter [a2,b2,c2] for ending point of vector: ');

%finding vector
vector = end_point - start_point;

hold on;
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;

% Sets the axis limits dynamically based on the input vectors (created just to visualize better)
%axis_range = max(abs([origin, start_point, end_point])) * 1.5;
%axis([-axis_range axis_range -axis_range axis_range -axis_range axis_range]);

% for plotting the coordinate frame
quiver3(origin(1),origin(2),origin(3),1,0,0, 'r', 'LineWidth', 1.5, 'MaxHeadSize',1);
quiver3(origin(1),origin(2),origin(3),0,1,0, 'g', 'LineWidth', 1.5, 'MaxHeadSize',1);
quiver3(origin(1),origin(2),origin(3),0,0,1, 'b', 'LineWidth', 1.5, 'MaxHeadSize',1);
% plotting the vector
quiver3(start_point(1), start_point(2), start_point(3), vector(1), vector(2), vector(3), 0, 'k', 'LineWidth', 2, 'MaxHeadSize', 1);
% plotting the points for better understanding
plot3(origin(1), origin(2), origin(3), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');  % Origin point
plot3(start_point(1), start_point(2), start_point(3), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');  % Start point
plot3(end_point(1), end_point(2), end_point(3), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');  % End point

% Show the vector components for better understanding
text(end_point(1), end_point(2), end_point(3), sprintf('Vector:[%0.2f, %0.2f, %0.2f]', vector(1), vector(2), vector(3)));

