clear;
clearvars;
clc;

[features, labels] = get_data();

features = features(1:1000, :);
labels = labels(1:1000, :);

k_sliceNum = 10;
kslices = cvpartition(size(features, 1), 'KFold', k_sliceNum);

accuracyArray = zeros(k_sliceNum, 1);
fscoreArray = zeros(k_sliceNum, 1);
total_fMeasureScore = 0;  

for i = 1 : kslices.NumTestSets
    trainIndices = kslices.training(i);
    testIndices = kslices.test(i);


    tree = Decision_Tree(features(trainIndices, :), labels(trainIndices, :));
    DrawDecisionTree(tree,'test')

    predictions = testdt(tree, features(testIndices, :) );
    actual = labels(testIndices, :);
    [fMeasureScore, precisionValue, recallValue] = fMeasure(actual, predictions);
    
    total_fMeasureScore = total_fMeasureScore + fMeasureScore;
    fscoreArray(i) = fMeasureScore;
    accuracyArray(i) = sum(predictions == labels(testIndices)) / (size(features, 1) / k_sliceNum);
    

end

disp('Mean F1 score');
total_fMeasureScore(isnan(total_fMeasureScore)) = mean(total_fMeasureScore(~isnan(total_fMeasureScore)));
disp(sum(total_fMeasureScore) / 10);
disp('F1 for all folds');
disp(fscoreArray);
disp('List of accuracies for folds: ');
disp(accuracyArray);
disp('Mean accuracy: ');
disp(mean(accuracyArray));

