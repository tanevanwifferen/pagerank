
function [matrix, transitions] = creatematrix(nodes, edges)
    matrix = zeros(size(nodes,1));
    for n = 1:size(edges);
        row = edges(n, [1,2]);
        if row(1) ~= row(2);
            matrix(row(2), row(1)) = 1;
        end;
    end;
    transitions = matrix / diag(sum(matrix));
    
    %indegrees = sum(matrix);
    %outdegrees = sum(matrix,2);
end
