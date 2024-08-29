% User Input for Frame {B} Location (To Matrix)
To = input('Enter the 4x4 transformation matrix To for frame {B}: ');

% Representative tools to draw the relation between two Frames
Hfr = [0 1 0 0 0 0 0;
       0 0 0 1 0 0 0;
       0 0 0 0 0 1 0;
       1 1 1 1 1 1 1];
frame0 = {''; 'x0'; ''; 'y0'; ''; 'z0'; ''};
frame1 = {''; 'x1'; ''; 'y1'; ''; 'z1'; ''};

% Origin of Frame {B}
xp = To(1,4); 
yp = To(2,4); 
zp = To(3,4);

% Plot Frame {A}
plot3(Hfr(1,:), Hfr(2,:), Hfr(3,:), 'b', 'LineWidth', 2);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
S1 = size(Hfr);

for i = 1:S1(2)
    c = Hfr(4,i); 
    if c == 0, c = 1; end
    x = Hfr(1,i) / c; 
    y = Hfr(2,i) / c; 
    z = Hfr(3,i) / c;
    text(x, y, z, frame0{i});
end

% Transform and Plot Frame {B}
Tfr = To * Hfr;
plot3(Tfr(1,:), Tfr(2,:), Tfr(3,:), 'r-.', 'LineWidth', 2);
axis equal; grid on;

S2 = size(Tfr);
for i = 1:S2(2)
    c = Tfr(4,i); 
    if c == 0, c = 1; end
    x = Tfr(1,i) / c; 
    y = Tfr(2,i) / c; 
    z = Tfr(3,i) / c;
    text(x, y, z, frame1{i});
end

% Plot the Vector from Frame {A} Origin to Frame {B} Origin
plot3([0 xp], [0 yp], [0 zp], 'g--', 'LineWidth', 2);
plot3(xp, yp, zp, 'ko', 'LineWidth', 2);

% Final Adjustments
axis equal;
grid on;
hold off;
