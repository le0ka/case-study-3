%% This is part two, not completed yet
load lightField.mat;


[img, x, y] = rays2img(rays(1, :), rays(3, :), 0.5, 1000);
figure();
image(img);
colormap gray;

% You can gain a slight amount of clarity in the image by increasing the
% sensor width of the camera, but it does not help sharpen the image in a
% meaningful way. 

% Changing the number of pixels does not change the clarity of the image as
% there are a certain number of rays that the function is using to create
% an image, so making the function use more pixels does not change
% anything. 

%% variable setup

% ray variables
d_1 = 0.25; % travel distance before focal length
d_2 = 0.375;

% Lense variables
f = 0.15; 


% Matricies:
M_1 = [1 d_1 0 0; 
       0 1 0 0; 
       0 0 1 d_1; 
       0 0 0 1]; % d_1 propagation

M_f = [1 0 0 0;
    -1/f 1 0 0;
       0 0 1 0;
       0 0 -1/f 1]; % lense transformation

M_2 = [1 d_2 0 0; 
       0 1 0 0; 
       0 0 1 d_2; 
       0 0 0 1]; % d_2 propagation

%% Implement optical system
d_1_rays = M_1 * rays;
bent_rays = M_f * d_1_rays;
d_2_rays = M_2 * bent_rays;

[img, x, y] = rays2img(d_2_rays(1, :), d_2_rays(3, :), 0.5, 1000);
figure();
image(img); 
colormap gray;


