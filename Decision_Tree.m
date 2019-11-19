function [Tree] = Decision_Tree(Features,Labels)
Tree = struct('op', {}, 'kids', {}, 'class', {}, 'attribute', {}, 'threshold', {}); 
if size(unique(Labels(:,1)), 1) == 1
    Tree(1).op = [];
    Tree(1).kids = [];
    Tree(1).class = majority_rule(Labels);
    Tree(1).attribute = [];
    Tree(1).threshold = [];
else
    %from attribute testing function, need the chosen attribute, its index,
    %the chosen threshold, and the X,Y,L data in the new splits
    [Attribute, Threshold] = chooseAttribute(Features,Labels);
    if Attribute < 50 
        out_string = 'x'+string(Attribute)+'>'+string(Threshold);
    else
        out_string = 'y'+string(Attribute-49)+'>'+string(Threshold);
    end
    Tree(1).op = out_string;
    Tree(1).class = [];
    Tree(1).attribute = Attribute;
    Tree(1).threshold = Threshold;
    [dataSplits,labels] = decisionSplit(Features,Features(:,Attribute),Labels,Threshold)
    Tree(1).kids = {Decision_Tree(dataSplits.left,labels.left),Decision_Tree(dataSplits.right,labels.right)};
end

    
end
