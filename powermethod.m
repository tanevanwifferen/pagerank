function [ pagerank ] = powermethod(transitions, n)
    pagerank = transitions^n * ones(size(transitions,1),1)/size(transitions,1);
end

