function [best_attribute, best_threshold] = chooseAttribute(features, targets)
    maxGain = 0;
    label = targets (:, 1);
    for i = 1:size(features, 2)
        usingColumn = features(:, i);
        
        minValue = min(usingColumn);
        maxValue = max(usingColumn);
        step = (maxValue - minValue) / 98;
        
        for j = minValue:step:maxValue
            gainValue = gains(usingColumn, label, j);
            
            if gainValue > maxGain
                maxGain = gainValue;
                best_attribute = i;
                best_threshold = j;
            end
        end
    end
end
