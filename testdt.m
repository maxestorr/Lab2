function predictions = testdt(tree, testfeatures)
     %Create array of 0s for tests
     predictions = zeros(length(testfeatures),1);
     for i = 1 : length(testfeatures) 
        leaf = tree;       
        while isempty(leaf.class)
            if testfeatures(i, leaf.attribute) < leaf.threshold
                leaf = leaf.kids{1};
            else
                leaf = leaf.kids{2};
            end
        end
        predictions(i) = leaf.class;
    end
end