function [split1, split2, split1Labels, split2Labels] = decisionSplit(features, labels, threshold)
split1 = []; split1Labels = [];
split2 = []; split2Labels = [];

for row=1:length(features)
    if norm(features(row, :)) < norm(threshold)
        split1(end+1) = features(row);
        split1Labels(end+1) = labels(row);
    else
        split2(end+1) = features(row);
        split2Labels(end+1) = labels(row);
    end
end
end