function data = data_generate()
%% inner part
r = 1 + randn(500, 1) * 0.1;
theta = randn(500, 1) * 2 * pi;
x1 = r .* cos(theta);
x2 = r .* sin(theta);

%% outer part
r = 2 + randn(500, 1) * 0.1;
theta = randn(500, 1) * 2 * pi;
x3 = r .* cos(theta);
x4 = r .* sin(theta);

%%
data = [x1, x2; x3, x4];
scatter(data(:,1), data(:,2))
title('The scatter plot of the data set (not linear separable)')