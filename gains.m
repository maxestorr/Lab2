function [gain, dataSplits, labels] = gains(data_column, labels_column, threshold) % Gain Function
    size = length(labels_column);
    
    % Sum of "Postive" and "Negative" examples
    sP = numel(labels_column(labels_column == 1));
    sN = numel(labels_column(labels_column == 0));
    
    entropyVal = entropy(sP, sN, size);
    [remainderVal, dataSplits, labels] = remainder(data_column, labels_column, threshold);
    gain = entropyVal - remainderVal;
end

function [remainderVal, dataSplits, labels] = remainder(data_column, labels_column, threshold)
    V = length(data_column);
    s1 = 0;
    s2 = 0;
    
    [dataSplits, labels] = decisionSplit(data_column, labels_column, threshold);
    
    % Find number of positive and negative examples in left and right
    % branches
    P1 = numel(labels.left(labels.left == 1));
    N1 = numel(labels.left(labels.left == 0));
    P2 = numel(labels.right(labels.right == 1));
    N2 = numel(labels.right(labels.right == 0));
    
    V1 = P1 + N1;
    V2 = P2 + N2;
    
    s1 = s1 + ((P1 + N1) / V) * entropy(P1, N1, V1);
    s2 = s2 + ((P2 + N2) / V) * entropy(P2, N2, V2);
    remainderVal = s1 + s2;
end

function entropyVal = entropy(P, N, size) % Entropy Function
    P = (P / size); % Ratio of + 
    N = (N / size); % Ratio of -
    
    if P == 0 || N == 0
        entropyVal = 0;
    else
        entropyVal = - P * log2(P) - N * log2(N);
    end
end