function K = updateK(oldK, data, indexes)
    sizes = size(data);
    K = zeros(size(oldK,1), sizes(1));
    
    % Recalculate each of the means
    for i=1:size(oldK,1)
      data_idx = data(idx==i,:)
      num_idx = size(data_idx,1);
      aux = zeros(1,size(data_idx,2))
      for j=1:size(data_idx,2)
          aux(1,j) = sum(data_idx(:,1))
      end
      K(i, :) = (1/num_idx) * [sum(data_idx(:,1)) sum(data_idx(:,2))];
    end
end  