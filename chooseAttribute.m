function [best_attribute, best_threshold] = chooseAttribute(features, targets)
    maxGain = 0;
    label = targets(:);
    for i = 1:length(features(1,:))
        usingColumn = features(:,i);
        
        minValue = min(usingColumn);
        maxValue = max(usingColumn);
        step = (maxValue - minValue) / 98;
        
        for j = minValue:step:maxValue
            [gainValue] = gains(features, usingColumn, label, j);
            
            if gainValue > maxGain
                maxGain = gainValue
                best_attribute = i;
                best_threshold = j;
            end
        end
    end
end
