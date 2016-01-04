function [ pagerank ] = powermethod(transitions, n)
    pagerank = ones(size(transitions,1),1)/size(transitions,1);
    pagerank = transitions^n * pagerank;
end

