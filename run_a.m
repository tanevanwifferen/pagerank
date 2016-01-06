[matrix,transitions]=loadmatrix('data');
transitions_sparse = sparse(transitions);
transitions_teleport = addteleport(transitions, 0.3);
transitions_sparse_teleport = sparse(transitions_teleport);

%G = digraph(matrix);

%%%%%%%%%%%%%%%
% POWERMETHOD %
%%%%%%%%%%%%%%%
n = 10000;
tic
pagerank_powermethod = powermethod(transitions,n);
toc
%tic
%pagerank_powermethod_sparse = powermethod(transitions_sparse,n);
%toc
tic
pagerank_powermethod_teleport = powermethod(transitions_teleport,n);
toc
tic
pagerank_powermethod_sparse_teleport = powermethod((transitions_sparse * 0.7) + (1 / size(transitions,1) * 0.3),n);
toc

%%%%%%%%%%%%%%%
% EIGENVECTOR %
%%%%%%%%%%%%%%%
tic
pagerank_eig = eigenvector(transitions);
toc
tic
pagerank_eig_teleport = eigenvector(transitions_teleport);
toc

csvwrite('results.csv', [transpose(1:size(matrix,1)) pagerank_eig pagerank_powermethod pagerank_eig_teleport pagerank_powermethod_teleport]);