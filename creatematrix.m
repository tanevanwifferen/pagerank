
function [matrix, transitions] = creatematrix(nodes, edges)
    matrix = zeros(size(nodes,1));
    for edge = edges';
        if edge(1) ~= edge(2);
            matrix(nodes(:,1) == edge(1), nodes(:,1) == edge(2)) = 1;
        end;
    end;
    transitions = createtransitions(matrix);
    
    %indegrees = sum(matrix);
    %outdegrees = sum(matrix,2);
end
