%% Part 2 + 3
load lightField.mat;


%% displaying original image
[img, x, y] = rays2img(rays(1, :), rays(3, :), 0.01, 1000);
figure();
image(img);
colormap gray;
title("Original Image With No Modification");

%% changing sensor width and sensor pixels

% You can gain a slight amount of clarity in the image by increasing the
% sensor width of the camera, but it does not help sharpen the image in a
% meaningful way. 

% Changing the number of pixels does not change the clarity of the image as
% there are a certain number of rays that the function is using to create
% an image, so making the function use more pixels does not change
% anything. 

%% propagating rays by some distance d
propagation_distances = [0.1 0.2 0.4 0.8];

for i = 1:length(propagation_distances)
    M_1 = [1 propagation_distances(i) 0 0; 
           0 1 0 0; 
           0 0 1 propagation_distances(i); 
           0 0 0 1];
    propagated_rays = M_1 * rays;
    [img, ~, ~] = rays2img(rays(1, :), rays(3, :), 0.5, 1000);
    figure();
    imshow(img);
    title(['Rays propagated by ', num2str(propagation_distances(i)), ' meters']);
end

% The rays in this image have already been propagated by a certain distance
% before I display it so continuing to propagate them will not make a
% difference when it comes to creating a clear image

%% variable setup
d_2 = 0.26; % ray propagation distance
f = 0.158; % focal length of lense

%% matrix setup
M_f = [1 0 0 0;
    -1/f 1 0 0;
       0 0 1 0;
       0 0 -1/f 1]; % lense transformation matrix

M_2 = [1 d_2 0 0; 
       0 1 0 0; 
       0 0 1 d_2; 
       0 0 0 1]; % propagation matrix

%% Implement optical system
bent_rays = M_f * rays;
d_2_rays = M_2 * bent_rays;

% show image with sensor width and number of pixels
[img, x, y] = rays2img(d_2_rays(1, :), d_2_rays(3, :), 0.01, 1000);
figure();
image(img); 
colormap gray;











