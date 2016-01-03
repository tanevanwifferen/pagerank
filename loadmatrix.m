function [matrix, transitions] = loadmatrix(folder)
    [nodes, edges] = readdata(folder);
    [matrix, transitions] = creatematrix(nodes, edges);
end
