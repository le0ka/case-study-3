%% This is the correct and finished part 1!!!!

% varibale setup

% ray variables
d_1 = 0.2; % travel distance before focal length
d_2 = 1; % after focal length
d = d_1 + d_2; % total distance

M_1 = [1 d_1 0 0; 
     0 1 0 0; 
     0 0 1 d_1; 
     0 0 0 1]; % transformation matrix 

x_angles = linspace(-pi/20, pi/20, 8);

% Lense variables
f = 0.15;
radius = 0.02; 

M_f = [1 0 0 0;
    -1/f 1 0 0;
       0 0 1 0;
       0 0 -1/f 1];

M_2 = [1 d_2 0 0; 
       0 1 0 0; 
       0 0 1 d_2; 
       0 0 0 1];

% 1st ray
hold on;
for i = 1:length(x_angles)
    initial_pos = [0 x_angles(i) 0 0]';
    final_pos = M_1 * initial_pos;
    final_pos_2 = M_f * final_pos;
    if (abs(final_pos_2(1)) <= 0.02)
        final_pos_3 = M_2 * final_pos_2;
        z_pos = [0 d_1 d];
        x_pos = [0 final_pos(1) final_pos_3(1)];

        plot(z_pos, x_pos, 'b');
    else
        z_pos = [0 d_1];
        x_pos = [0 final_pos(1)];

        plot(z_pos, x_pos, 'b');

    end
    
end

% 2nd ray
for i = 1:length(x_angles)
    initial_pos = [0.01 x_angles(i) 0 0]';
    final_pos = M_1 * initial_pos;
    final_pos_2 = M_f * final_pos;
    if(abs(final_pos_2(1)) <= 0.02)
        final_pos_3 = M_2 * final_pos_2;
        z_pos = [0 d_1 d];
        x_pos = [0.01 final_pos(1) final_pos_3(1)];

        plot(z_pos, x_pos, 'r');
    else
        z_pos = [0 d_1];
        x_pos = [0.01 final_pos(1)];

        plot(z_pos, x_pos, 'r');
    end
end

% show lense on plot
x_values = [0.2, 0.2];
y_values = [-0.02, 0.02];
plot(x_values, y_values, 'black');

title("rays");
xlim([0 1]);
hold off;