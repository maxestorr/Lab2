function [p1, n1, p2, n2] = fast_splits(column, labelsColumn, threshold)
p1 = 0;
n1 = 0;
p2 = 0;
n2 = 0;
for row=1:length(column)
    if column(row, :) < threshold  % Feature < threshold
        if labelsColumn(row,1) == 0
            n1 = n1 + 1;
        else
            p1 = p1 + 1;
        end
            
    else  % Feature >= threshold
        if labelsColumn(row,1) == 1
            n2 = n2 + 1;
        else
            p2 = p2 + 1;
        end
    end
end