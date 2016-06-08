%% 
% Input:
%     data      a matrix of order n * d. A row is an observation and a
%               column is a variable.
%     delta     a scalar. To control the similarity.
%     K         a scalar. The dimension of the output F.
% Output:
%     F         a matrix of order n * K. A row is an observation.
function F = laplace_transform(data, delta, K)
%% Initial settings
if nargin < 2
    delta = 1;
end
if nargin < 3
    K = 2;
end

% init similarity matrix
W = zeros(size(data,1), size(data,1));

%% Compute similarity
for i = 1:size(W, 1)
    dist = sum(((repmat(data(i,:), size(data,1), 1)) - data) .^ 2, 2);
    W(i,:) = exp(- dist / delta);
end

%% Get F
% Laplace matrix
d = sum(W, 2);
d = d .^ (-1/2);
D = diag(d);
[F, ~] = svd(D * W * D);
F = F(:, 1:K);

end
