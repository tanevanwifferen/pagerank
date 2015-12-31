
function [nodes, edges, matrix, indegrees, outdegrees, transitions] = creatematrix()
    nodes = importdata('data/nodes.txt');
    edges = importdata('data/edges.txt');
    size2 = size(nodes);
    matrix = zeros(size2(1));
    for n = 1:size(edges);
        row = edges(n, [1,2]);
        if row(1) ~= row(2);
            matrix(row(2), row(1)) = 1;
        end;
    end;
    
    indegrees = sum(matrix);
    outdegrees = sum(matrix,2);
    
    transitions = matrix / diag(sum(matrix));
    
end
