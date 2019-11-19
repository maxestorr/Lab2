function predictions = testdt(tree, testfeatures)
    %create array of 0s for tests
    predictions = zeros(size(testfeatures, 1), 1);
     for i = 1 : size(testfeatures, 1)
        
        leaf = tree;
        
        while isempty(leaf.class)
            if features(i, leaf.attribute) < leaf.threshold
                leaf = leaf.kids{1};
            else
                leaf = leaf.kids{2};
            end
        end
        predictions(i) = leaf.class;
    end
end

