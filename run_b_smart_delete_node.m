folder = 'data/real';
nodes = importdata(strcat(folder, '/nodes.txt'));
edges = importdata(strcat(folder, '/edges.txt'));

tic
[~, transitions] = creatematrix(nodes, edges);
transitions_before = addteleport(transitions, 0.3);
pagerank_before = powermethod(transitions_before, 10000);
cumul_before = cumsum(pagerank_before);
toc

pagerank_after = [];

for sample = 1:1    
    find(cumul_before >= rand()*cumul_before(end));
    
    deleted = ans(1);
    transitions = deletenode(transitions, deleted);

    tic
    transitions_after = addteleport(transitions, 0.3);
    pagerank_after = [pagerank_after powermethod(transitions_after, 10000)];
    toc
end

distances = [];
distances(1:size(transitions,1)) = -1;
distances(deleted(1)) = 0;
i = 0;
while any(distances == i)
    for x = find(distances == i)
        temp = distances(edges(edges(:,1) == x,2));
        temp(temp == -1) = i + 1;
        distances(edges(edges(:,1) == x,2)) = temp;
    end
    i = i + 1;
end

pagerank_before(deleted) = [];
plot(distances',pagerank_after(:,end) - pagerank_before,'g.'); grid on
csvwrite('results.csv', [[1:deleted-1 deleted+1:size(nodes)]' distances' pagerank_before pagerank_after]);