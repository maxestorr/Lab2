function [fMeasureScore, precisionValue, recallValue] = fMeasure(actual, predicted)
    %Implementing F1 where β = 1
    precisionValue = fmeasureComponentCalculation(actual, predicted, 1);
    recallValue = fmeasureComponentCalculation(actual, predicted, 0);
    fMeasureScore = 2 * ((precisionValue * recallValue) / (precisionValue + recallValue));
end


function output = fmeasureComponentCalculation(actual, predicted, isPrecision)
    calcRatio = @(X, Y) X/(X + Y);
    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;

    for i = 1:length(actual)
        if actual(i) == 1
            if predicted(i) == 1
                TP = TP + 1;
            else
                FN = FN + 1;
            end
        else
            if predicted(i) == 1
                FP = FP +1;
            else
                TN = TN + 1;
            end
        end 
    end
    
    if (isPrecision == 1)
        calc = calcRatio(TP,FP);
    else
        calc = calcRatio(TP,FN);
    end
    
    if(isnan(calc))
        output = 0;
    else
        output = calc;
    end
end

