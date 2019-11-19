function [Tree] = Decision_Tree(Features,Labels)
Tree = struct('op', {}, 'kids', {}, 'class', {}, 'attribute', {}, 'threshold', {}); 
if size(unique(Labels), 1) == 1
    Tree.op = [];
    Tree.kids = [];
    Tree.class = majority_rule(Labels);
    Tree.attribute = [];
    Tree.threshold = [];
else
    %from attribute testing function, need the chosen attribute, its index,
    %the chosen threshold, and the X,Y,L data in the new splits
    [Attribute, Threshold,dataSplits, labels] = chooseAttribute(Features,Labels);
    if Attribute < 50
        Tree.op = 'x' + str(Attribute);
    else
        Tree.op = 'x' + str(Attribute-49);
    end
    Tree.op = Attribute;
    Tree.class = [];
    Tree.attribute = Attribute;
    Tree.threshold = Threshold;
    Tree.kids = {Decision_Tree(dataSplits.left,labels.left),Decision_Tree(dataSplits.right,labels.right)};
end

    
end
