function [DataX, DataY, Labels] = get_data()
    DataX = table2array(readtable('predx_for_classification.csv'));
    DataY = table2array(readtable('predy_for_classification.csv'));
    Labels = table2array(readtable('label.csv'));
end

