clear;
clearvars;
clc;

[features, labels] = get_data();

%features = features(1:10000, :);
%labels = labels(1:10000, :);

k_sliceNum = 10;
kslices = cvpartition(size(features, 1), 'KFold', k_sliceNum);

accuracyArray = zeros(k_sliceNum, 1);
total_fMeasureScore = 0;

for i = 1 : kslices.NumTestSets
    trainIndices = kslices.training(i);
    testIndices = kslices.test(i);


    tree = Decision_Tree(features(trainIndices, :), labels(trainIndices, :));
    DrawDecisionTree(tree,'test')
    
    nodeToRemove.kids = {};
    nodeToRemove.op = '';
    nodeToRemove.class = 0;
    nodeToRemove.attribute = 0;
    nodeToRemove.threshold = 0;
    
    tree.kids{1,1}.kids{1,1}.kids{1,2} = nodeToRemove;
    tree.kids{1,2}.kids{1,2}.kids{1,1} = nodeToRemove;
    tree.kids{1,1}.kids{1,2}.kids{1,1}.kids{1,1} = nodeToRemove;
 
    DrawDecisionTree(tree,'test2')

    predictions = testdt(tree, features(testIndices, :) );
    actual = labels(testIndices, :);
    [fMeasureScore, precisionValue, recallValue] = fMeasure(actual, predictions);
    
    total_fMeasureScore = (total_fMeasureScore + fMeasureScore);
    
    accuracyArray(i) = sum(predictions == labels(testIndices)) / (size(features, 1) / k_sliceNum);
    return
    

end

disp('Mean F1 score');
total_fMeasureScore(isnan(total_fMeasureScore)) = mean(total_fMeasureScore(~isnan(total_fMeasureScore)));
disp(sum(total_fMeasureScore) / 20);
disp('List of accuracies for folds: ');
disp(accuracyArray);
disp('Mean accuracy: ');
disp(mean(accuracyArray));

