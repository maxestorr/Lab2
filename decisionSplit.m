function [dataSplits, labels] = decisionSplit(dataColumn, labelsColumn, threshold)
% Create structs to contain splits and labels for left and right branches
% of the current node.
dataSplits.left = []; labels.left = [];
dataSplits.right = []; labels.right = [];

for row=1:length(dataColumn)
    if dataColumn(row, :) < threshold  % Feature < threshold
        dataSplits.left(end+1, :) = dataColumn(row, :);
        labels.left(end+1) = labelsColumn(row);
    else  % Feature >= threshold
        dataSplits.right(end+1, :) = dataColumn(row, :);
        labels.right(end+1) = labelsColumn(row);
    end
end
end