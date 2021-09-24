% Return a vector with the indexes for which the
% given point is closest to. This index is the bin
% the point will be associated to on this step.
function indexes = getClosest(data, K)
  n = size(K, 1);
  indexes = zeros(size(data,1), 1);
  m = size(data,1);
  % Calculates distance between each point and the Ks
  % We use the norm 2, or the euclidean distance
  for i=1:m
    k = 1;
    min_dist = norm(data(i,:)-K(1,:), 2);
    for j=2:n
        dist = norm(data(i,:)-K(j,:), 2);
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    indexes(i) = k;
  end
end