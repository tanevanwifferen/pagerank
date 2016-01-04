function [matrix, transitions] = loadmatrix(folder)
    nodes = importdata(strcat(folder, '/nodes.txt'));
    edges = importdata(strcat(folder, '/edges.txt'));
    [matrix, transitions] = creatematrix(nodes, edges);
end
