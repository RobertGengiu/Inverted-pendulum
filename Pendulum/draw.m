function draw(y, m, M, L)
x = y(1);                           % pozitia cartului pe x
theta = y(3);                       % unghiul pendulului

% dimensiunile cartului
Width = sqrt(M/5);                  % latimea cartului
Height = 0.5 * sqrt(M/5);           % inaltimea cartului
WheelsRadius = 0.2;                 % dimensiunea rotilor
mRadius = 0.3 * sqrt(m);            % dimensiunea pendului

% pozitiile
y = WheelsRadius / 2 + Height / 2;  % pozitia verticala a cartului
wheel_1_x = x - 0.9 * Width / 2;    % roata din stanga
wheel_1_y = 0;
wheel_2_x = x + 0.65 * Width / 2;   % roata din dreapta
wheel_2_y = 0;
pendulum_x = x + L * sin(theta);
pendulum_y = y - L * cos(theta);

% figure
plot([-100 100], [0 0] ,'k', 'LineWidth', 3)
hold on

rectangle('Position',[x-Width/2,y-Height/2,Width,Height],'Curvature',.1,'FaceColor',[1 0.1 0.1])
rectangle('Position',[wheel_1_x,wheel_1_y,WheelsRadius,WheelsRadius],'Curvature',1,'FaceColor',[0 0 0])
rectangle('Position',[wheel_2_x,wheel_2_y,WheelsRadius,WheelsRadius],'Curvature',1,'FaceColor',[0 0 0])

plot([x pendulum_x],[y pendulum_y],'k','LineWidth',2)
rectangle('Position',[pendulum_x-mRadius/2,pendulum_y-mRadius/2,mRadius,mRadius],'Curvature',1,'FaceColor',[.1 0.1 1])

%limitele figurii
xlim([x - 3.5  x + 3.5]);
ylim([-(L+1) (L+1)]);
drawnow
hold off