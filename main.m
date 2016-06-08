data = data_generate();
F = laplace_transform(data, 0.01, 2);
figure(2)
scatter(F(:,1), F(:,2))
title('The scatter plot of the transformed data (linear separable)')