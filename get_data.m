function [Features, Labels] = get_data()
%Function loads the data and labels from the .csv files, combines the X and Y data into a single array
%and exports them to the main program
    DataX = table2array(readtable('predx_for_classification.csv'));
    DataY = table2array(readtable('predy_for_classification.csv'));
    Labels = table2array(readtable('label.csv'));
    Features = [DataX,DataY];
    
end

