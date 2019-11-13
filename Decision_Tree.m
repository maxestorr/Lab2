function [Tree] = Decision_Tree(DataX,DataY,Labels)
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
    [Attribute, index, threshold] = attribute_test(DataX,DataY,Labels);
    Tree.op = Attribute;
    Tree.class = [];
    Tree.attribute = Index;
    Tree.threshold = Threshold;
    Tree.kids = {Decision_Tree(DataX1,DataY1,Labels1),Decision_Tree(DataX2,DataY2,Labels2)};
end

    
end

