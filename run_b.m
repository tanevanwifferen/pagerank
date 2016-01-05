folder = 'data/real';
nodes = importdata(strcat(folder, '/nodes.txt'));
edges = importdata(strcat(folder, '/edges.txt'));

tic
[~, transitions] = creatematrix(nodes, edges);
transitions_before = sparse(transitions);
pagerank_before = powermethod((transitions_before * 0.7) + (1 / size(nodes,1) * 0.3),10000);
toc

for i = 1:19020
    index = randi(size(edges,1));
    deleted = edges(index,:);
    edges(index,:) = [];
end

tic
[matrix, transitions] = creatematrix(nodes, edges);
transitions_after = sparse(transitions);
pagerank_after = powermethod((transitions_after * 0.7) + (1 / size(nodes,1) * 0.3),10000);
toc

sum(pagerank_before == pagerank_after)

tic
distances = [];
distances(1:size(transitions,1)) = Inf;
distances(deleted) = 0;
i = 0;
while any(distances == i)
    for x = find(distances == i)
        temp = distances(edges(edges(:,1) == x,2));
        temp(temp == Inf) = i + 1;
        distances(edges(edges(:,1) == x,2)) = temp;
    end
    i = i + 1;
end
toc