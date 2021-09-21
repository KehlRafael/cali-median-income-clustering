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

% Here we could normalize the median income, but the range is not too big
% maxIncome = max(data(:,3))
% data(:,3) = data(:,3)/maxIncome

# We first plot the California map of households
scatter(data(:,1), data(:,2),'.');
axis('tight');
title({'Map of California Households'; "1990's census"});
xlabel('Longitude');
ylabel('Latitude');
printf("Scatter plot being displayed. Press any key to continue...\n\n")
pause;
close;

# Now we do a 3D scatter plot to visualize the income in the Z axis
scatter3(data(:,1), data(:,2), data(:,3), [], data(:,3), '.');
axis('tight');
title({'Map of California Households'; "1990's census"});
xlabel('Longitude');
ylabel('Latitude');
zlabel('Med. Income');
printf("3D Scatter plot being displayed. Press any key to continue...\n\n")
pause;
close;

% We are now ready to start our K-means. We first need an initial position
k = 3
K = initialPos(data, k)

% Now we get execute our K-means algorithm

