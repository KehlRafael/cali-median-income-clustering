function K = updateK(oldK, data, indexes)
    kazam=1;
    K = zeros(size(oldK));
    
    % Recalculate each of the means
    for i=1:size(oldK,1)
      data_idx = data(indexes(:)==i,:);
      num_idx = size(data_idx,1);
      aux = zeros(1,size(data_idx,2));
      aux = sum(data_idx);
      K(i, :) = (1/num_idx) * aux;
    end
end