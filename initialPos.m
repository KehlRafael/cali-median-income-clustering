% Retrieves K points from your dataset as inital postions
% for you K-means algorithm
function initialK = initialPos(data, K)
    initialK = zeros(K,size(data,2)); 
    i = randperm(size(data,1));
    initialK = data(i(1:K), :);
end