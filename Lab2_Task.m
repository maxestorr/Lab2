%Load Data
[Data,Labels] = get_data();
Tree = Decision_Tree(Data(1:400,:),Labels(1:400,:));
DrawDecisionTree(Tree,'test')

