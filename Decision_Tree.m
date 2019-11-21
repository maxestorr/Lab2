function [Tree] = Decision_Tree(Features,Labels)
%Build the tree as needed for use with DrawDecisionTree
Tree = struct('op', {}, 'kids', {}, 'class', {}, 'attribute', {}, 'threshold', {}); 
%Check for a leaf node (where all datapoints are the same class)
if size(unique(Labels(:,1)), 1) == 1
    Tree(1).op = [];
    Tree(1).kids = [];
    Tree(1).class = majority_rule(Labels);
    Tree(1).attribute = [];
    Tree(1).threshold = [];
else
    %If we don't identify a leaf node, call chooseAttribute to find the optimal split
    [Attribute, Threshold] = chooseAttribute(Features,Labels);
    %Convert the output attribute index into a string along with the given threshold
    if Attribute < 50 
        out_string = 'x'+string(Attribute)+'>'+string(Threshold);
    else
        out_string = 'y'+string(Attribute-49)+'>'+string(Threshold);
    end
    Tree(1).op = out_string; 
    Tree(1).class = [];
    Tree(1).attribute = Attribute;
    Tree(1).threshold = Threshold;
    %Run the slow step decisionSplit, which splits the input dataset into two according
    %to the optimal decision rule.
    [dataSplits,labels] = decisionSplit(Features,Features(:,Attribute),Labels,Threshold)
    %Recursive loop to go down a branch of the tree
    Tree(1).kids = {Decision_Tree(dataSplits.left,labels.left),Decision_Tree(dataSplits.right,labels.right)};
end

    
end
