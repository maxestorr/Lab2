function [best_attribute, best_threshold, bestSplit, bestLabels] = chooseAttribute(features, targets)
    maxGain = 0;
    label = targets(:, 1);
    for i = 1:length(features)
        usingColumn = features;
        
        minValue = min(usingColumn);
        maxValue = max(usingColumn);
        step = (maxValue - minValue) / 98;
        
        for j = minValue:step:maxValue
            [gainValue, dataSplit, labels] = gains(usingColumn, label, j);
            
            if gainValue > maxGain
                maxGain = gainValue;
                best_attribute = i;
                best_threshold = j;
                bestSplit = dataSplit;
                bestLabels = labels;
            end
        end
    end
end
