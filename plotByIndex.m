function plotByIndex(data, K, indexes)
    hold on;
    for i=1:size(K,1)
        data_idx = data(indexes(:)==i,:);
        scatter3(data_idx(:,1),data_idx(:,2),data_idx(:,3),7,'filled',...
            'DisplayName',int2str(i));
    endfor
    legend;
    axis('tight');
    title({'Map of California Households'; "1990's census"});
    xlabel('Longitude');
    ylabel('Latitude');
    zlabel('Med. Income');
    hold off;
    printf("Scatter plot by indexes being shown. Press any key to continue...\n\n")
    pause;
endfunction