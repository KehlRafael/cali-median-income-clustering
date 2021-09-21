% Return a vector with the indexes for which the
% given point is closest to. This index is the bin
% the point will be associated to on this step.
function indexes = getClosest(data, K)
  n = size(K, 1);
  indexes = zeros(size(data,1), 1);
  m = size(data,1);
  % Calculates distance between each point and the Ks
  % No need to square the distance, so it runs faster
  for i=1:m
    k = 1;
    min_dist = sum((data(i,:) - data(1,:)) .^ 2);
    for j=2:n
        dist = sum((data(i,:) - data(j,:)) .^ 2);
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    indexes(i) = k;
  end
end