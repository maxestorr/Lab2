function [Label] = majority_rule(Labels)
% Function calculates how many members of each class are in the dataset.
% This doesn't do much work in the current code, but could be usefully expanded for a multiclass problem
Length = length(Labels);
M0 = 0;
M1 = 0;
for i = 1:Length
    if Labels(i) == 0
        M0 = M0 + 1;
    elseif Labels(i) == 1
        M1 = M1 + 1;
    end
end
if M0 > M1
    Label = 0;
elseif M1 > M0
    Label = 1;
else
    Label = [];
end
