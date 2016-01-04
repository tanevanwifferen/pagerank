function [ pagerank ] = eigenvector(transitions)
    [V,D] = eig(transitions);
    pagerank = V(:,diag(D) >= 1) / sum(V(:,diag(D) >= 1));
end

