%% This is part two, not completed yet
load lightField.mat;

[img, x, y] = rays2img(rays(1, :), rays(3, :), 0.005, 400);

imshow(img);