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
    [Attribute, threshold,Features1,Features2,Labels1,Labels2] = attribute_test(Features,Labels);
    Tree.op = Attribute;
    Tree.class = [];
    Tree.attribute = Index;
    Tree.threshold = Threshold;
    Tree.kids = {Decision_Tree(Features1,Labels1),Decision_Tree(Features2,Labels2)};
end

    
end

