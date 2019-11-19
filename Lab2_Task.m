[Data,Labels] = get_data();
Tree = Decision_Tree(Data,Labels);
DrawDecisionTree(Tree,'test')
