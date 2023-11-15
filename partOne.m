d = 0.001; % distance of wave propagation for each time step
ray_travel_dist = 0.4; % total distance of wave propagation
num_steps = ray_travel_dist / d; % total number of steps
steps_vector = [0 0 d 0]'; % update z value after each step

x_1_initial = 0; % initial height 1
x_2_initial = 0.01; % inital height 2
z_initial = 0; % y height, stays constant, along w/ angle

x_angles = linspace(-pi/20, pi/20, 8); % collection of startin x angles

M = [1 d 0 0; 
     0 1 0 0; 
     0 0 1 d; 
     0 0 0 1];

% Lense variables
f = 0.15;
radius = 0.02; 

M_f = [1 0 0 0;
    -1/f 1 0 0;
       0 0 1 0;
       0 0 -1/f 1];

hold on;
for j = 1: length(x_angles)

    x_z = zeros(4, num_steps);
    x_z(:, 1) = [x_1_initial x_angles(j) z_initial 0]' + steps_vector;


    for i = 2:num_steps
        x_z(:, i) = M * x_z(:, i-1) + steps_vector;
    end


    plot(x_z(3, :), x_z(1, :), 'b');
end

for j = 1: length(x_angles)

    x_z = zeros(4, num_steps);
    x_z(:, 1) = [x_2_initial x_angles(j) z_initial 0]' + steps_vector;


    for i = 2:num_steps
        x_z(:, i) = M * x_z(:, i-1) + steps_vector;
    end


    plot(x_z(3, :), x_z(1, :), 'r');
end

hold off;