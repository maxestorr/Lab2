function predictions = testdt(tree, testfeatures)
     %Create array of 0s for predictions to write to 
     predictions = zeros(length(testfeatures),1);
     
     % iterate through samples for predictions
     for i = 1 : length(testfeatures) 
        % reset the node for next sample 
        treeNode = tree;       
        
        while isempty(treeNode.class)
            % checks node's threshold and classifies it into 1 of 2 groups
            if testfeatures(i, treeNode.attribute) < treeNode.threshold
                treeNode = treeNode.kids{1};
            else
                treeNode = treeNode.kids{2};
            end
        end
        %add to predictions
        predictions(i) = treeNode.class;
    end
end