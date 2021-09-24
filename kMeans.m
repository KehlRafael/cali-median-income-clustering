% Run the K-means algorithm until theres no change in our
% K values. Return the indexes for each point in the data
% and the evolution of our K and indexes.
function [indexes, K_history, indexes_history] = kMeans(K, data)
    indexes = zeros(size(data,1), 1);
    indexes_history = zeros(size(data,1), 1);
    K_history = zeros(size(K,1), size(K,2), 2);
    K_history(:,:,1) = K;
    % Do the first step outside the loop so we can use While
    i = 2;
    indexes_history(:,:,i) = getClosest(data, K);
    indexes = indexes_history(:,:,i);
    K_history(:,:,i) = updateK(K, data, indexes);
    K = K_history(:,:,i);
    % Define error for floating point number
    eps = 0.000001;
    % Iterate until theres no change in K
    while(abs(K_history(:,:,i-1)-K_history(:,:,i))>eps)
        i = i+1;
        indexes_history(:,:,i) = getClosest(data, K);
        indexes = indexes_history(:,:,i);
        K_history(:,:,i) = updateK(K, data, indexes);
        K = K_history(:,:,i);
        if(i == 20000)
            break;
        end
    endwhile
end