folder = 'data/real';
nodes = importdata(strcat(folder, '/nodes.txt'));
edges = importdata(strcat(folder, '/edges.txt'));

tic
[~, transitions] = creatematrix(nodes, edges);
transitions_before = addteleport(transitions, 0.3);
pagerank_before = powermethod(transitions_before, 10000);
toc

pagerank_after = [];

for sample = 1:100
    edges = importdata(strcat(folder, '/edges.txt'));

    index = randi(size(edges,1));
    deleted = edges(index,:);
    edges(index,:) = [];

    tic
    [matrix, transitions] = creatematrix(nodes, edges);
    transitions_after = addteleport(transitions, 0.3);
    pagerank_after = [pagerank_after powermethod(transitions_after, 10000)];
    toc
end

distances_from = [];
distances_from(1:size(transitions,1)) = -1;
distances_from(deleted(1)) = 0;
i = 0;
while any(distances_from == i)
    for x = find(distances_from == i)
        temp = distances_from(edges(edges(:,1) == x,2));
        temp(temp == -1) = i + 1;
        distances_from(edges(edges(:,1) == x,2)) = temp;
    end
    i = i + 1;
end

distances_to = [];
distances_to(1:size(transitions,1)) = -1;
distances_to(deleted(2)) = 0;
i = 0;
while any(distances_to == i)
    for x = find(distances_to == i)
        temp = distances_to(edges(edges(:,1) == x,2));
        temp(temp == -1) = i + 1;
        distances_to(edges(edges(:,1) == x,2)) = temp;
    end
    i = i + 1;
end

plot(distances_from'-0.05,pagerank_after(:,1) - pagerank_before,'g.',distances_to'+0.05,pagerank_after(:,1)-pagerank_before,'r.',min(distances_from,distances_to)',pagerank_after(:,1)-pagerank_before,'.'); grid on
csvwrite('results.csv', [(1:size(distances_from,2))' distances_from' pagerank_before pagerank_after]);