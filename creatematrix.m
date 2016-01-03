
function [matrix, transitions] = creatematrix(nodes, edges)
    matrix = zeros(size(nodes,1));
    for n = 1:size(edges);
        row = edges(n, [1,2]);
        if row(1) ~= row(2);
            matrix(row(2), row(1)) = 1;
        end;
    end;
    div = sum(matrix);
    div(div == 0) = 1; % Replace 0 by 1, because division by 0 gives NaN, but we want 0
    transitions = matrix / diag(div);
    
    %indegrees = sum(matrix);
    %outdegrees = sum(matrix,2);
end
