% varibale setup

% ray variables
d = 0.2; % travel distance before focal length
d_2 = 0; % after focal length
M_1 = [1 d 0 0; 
     0 1 0 0; 
     0 0 1 d; 
     0 0 0 1]; % transformation matrix 
x_angles = linspace(-pi/20, pi/20, 8);

% Lense variables
f = 0.15;
radius = 0.02; 

M_f = [1 0 0 0;
    -1/f 1 0 0;
       0 0 1 0;
       0 0 -1/f 1];
M_2 = 

% 1st ray
hold on;
for i = 1:length(x_angles)
    initial_pos = [0 x_angles(i) 0 0]';
    final_pos = M_1 * initial_pos;
    % p_1 = (initial z = 0, initial x = 0)
    % p_2 = (final z = 0.2, final x = final_pos(1))
    z_pos = [0 0.2];
    x_pos = [0 final_pos(1)];

   plot(z_pos, x_pos, 'b');
end

% 2nd ray
for i = 1:length(x_angles)
    initial_pos = [0.01 x_angles(i) 0 0]';
    final_pos = M_1 * initial_pos;
    % p_1 = (initial z = 0, initial x = 0)
    % p_2 = (final z = 0.2, final x = final_pos(1))
    z_pos = [0 0.2];
    x_pos = [0.01 final_pos(1)];

   plot(z_pos, x_pos, 'r');
end
title("rays");
hold off;