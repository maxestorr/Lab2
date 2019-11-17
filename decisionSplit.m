function [split1, split2, split1Labels, split2Labels] = decisionSplit(dataColumn, labels, threshold)
split1 = []; split1Labels = [];
split2 = []; split2Labels = [];

for row=1:length(dataColumn)
    if dataColumn(row, :) < threshold
        split1(end+1, :) = dataColumn(row, :);
        split1Labels(end+1) = labels(row);
    else
        split2(end+1, :) = dataColumn(row, :);
        split2Labels(end+1) = labels(row);
    end
end
end