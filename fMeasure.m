function [fMeasureScore, precisionValue, recallValue] = fMeasure(actual, predicted)
    %Implementing F1 where β = 1
    %get precision 
    precisionValue = fmeasureComponentCalculation(actual, predicted, 1);
    recallValue = fmeasureComponentCalculation(actual, predicted, 0);
    
    %get a fscore
    fMeasureScore = 2 * ((precisionValue * recallValue) / (precisionValue + recallValue));
end


function output = fmeasureComponentCalculation(actual, predicted, isPrecision)
    %anonymous func because both use the same formula but different variables
    calcRatio = @(X, Y) X/(X + Y);
    
    %init vars
    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;
    
    %iterate through actual values
    for i = 1:length(actual)
        %if actual is 1, and predicted is 1, TP, else FN
        if actual(i) == 1
            if predicted(i) == 1
                TP = TP + 1;
            else
                FN = FN + 1;
            end
        else
            %if actual is 0, and predicted is 1, FN else TN
            if predicted(i) == 1
                FP = FP +1;
            else
                TN = TN + 1;
            end
        end 
    end
    
    %get calc depending on if this a precision or recall 
    if (isPrecision == 1)
        calc = calcRatio(TP,FP);
    else
        calc = calcRatio(TP,FN);
    end
    
    %in case nothing horrible has happened, return the value 
    if(isnan(calc))
        output = 0;
    else
        output = calc;
    end
end









