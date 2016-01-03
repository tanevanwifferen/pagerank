function [nodes,edges] = readdata(folder)
    nodes = importdata(strcat(folder, '/nodes.txt'));
    edges = importdata(strcat(folder, '/edges.txt'));
end

