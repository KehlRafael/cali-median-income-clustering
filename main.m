% K-means algorithm to group California households by median income and location
% The dataset is availabe at:
% https://www.kaggle.com/camnugent/california-housing-prices
% It is the California census of 1990

dataset = csvread('./data/housing.csv');
% Remove first line, it is the header
dataset(1,:) = [];

% We want to group them by location and income, therefore, we must
% now get longitude, latitude and median income from the dataset
data = [dataset(:,1) dataset(:,2) dataset(:,8)];

# We first plot the California map of households
scatter(data(:,1), data(:,2),7,'filled');
axis('tight');
title({'Map of California Households'; "1990's census"});
xlabel('Longitude');
ylabel('Latitude');
printf("Scatter plot being displayed. Press any key to continue...\n\n")
pause;
close;

# Now we do a 3D scatter plot to visualize the income in the Z axis
scatter3(data(:,1), data(:,2), data(:,3), [], data(:,3),'.');
axis('tight');
title({'Map of California Households'; "1990's census"});
xlabel('Longitude');
ylabel('Latitude');
zlabel('Med. Income');
printf("3D Scatter plot being displayed. Press any key to continue...\n\n")
pause;
close;

% Now we normalize the data
maxLon = max(data(:,1));
data(:,1) = data(:,1)/maxLon;
maxLat = max(data(:,2));
data(:,2) = data(:,2)/maxLat;
maxIncome = max(data(:,3));
data(:,3) = data(:,3)/maxIncome;

% We are ready to start our K-means. We first need an initial position
k = 3;
K = initialPos(data, k);

% Now we get execute our K-means algorithm
[indexes, K, indexes_history] = kMeans(K, data);

% Before plotting, we un-normalize the data
data(:,1) = data(:,1)*maxLon;
K(:,1) = K(:,1)*maxLon;
data(:,2) = data(:,2)*maxLat;
K(:,2) = K(:,2)*maxLat;
data(:,3) = data(:,3)*maxIncome;
K(:,3) = K(:,3)*maxIncome;
plotByIndex(data, K, indexes);
