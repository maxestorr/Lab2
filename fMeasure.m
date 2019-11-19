function fMeasureScore, precisionValue, recallValue = fMeasure(actual, predicted)
    %Implementing F1 where β = 1
    
    precisionValue = precision(actual, predicted);
    recallValue = recall(actual, predicted);
    
    fMeasureScore = 2 * ((precisionValue * recallValue) / (precisionValue + recallValue));
end

function output = precision(actual, predicted)
    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;
    for i = 1:length(actual)
        if actual(i) == 1
            if predicted(i) == 1
                TP = TP + 1;
            else
                FP = FP + 1;
            end
        else
            if predicted(i) == 1
                FN = FN +1;
            else
                TN = TN + 1;
            end
        end
                
            
    end
    output = TP/(TP + FP);
end

function output = recall(actual, predicted)
    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;
    for i = 1:length(actual)
        if actual(i) == 1
            if predicted(i) == 1
                TP = TP + 1;
            else
                FP = FP + 1;
            end
        else
            if predicted(i) == 1
                FN = FN +1;
            else
                TN = TN + 1;
            end
        end
                
            
    end
    output =TP/(TP + FN);
end
