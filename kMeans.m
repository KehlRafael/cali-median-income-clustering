% Run the K-means algorithm until theres no change in our
% K values. Return the indexes for each point in the data
% and the evolution of our K and indexes.
function [indexes, K_history, indexes_history] = kMeans(K, data)
    indexes = zeros(size(data,1), 1);
    indexes_history = zeros(size(data,1), 1);
    K_history = zeros(size(K,1), size(K,2), 2);
    K_history(:,:,1) = K
    i = 2;
    % Iterate until theres no change in K
    while(K_history(:,:,i-1)!=K_history(:,:,i))
        indexes = getClosest(data, K)
        K_history(:,:,i) = updateK(K, data, indexes)
        K = K_history(:,:,i)
    endwhile
end