
function [matrix, transitions] = creatematrix(nodes, edges)
    matrix = zeros(size(nodes,1));
    for n = 1:size(edges);
        edge = edges(n,:);
        if edge(1) ~= edge(2);
            matrix(nodes == edge(1), nodes == edge(2)) = 1;
        end;
    end;
    transitions = createtransitions(matrix);
    
    %indegrees = sum(matrix);
    %outdegrees = sum(matrix,2);
end
