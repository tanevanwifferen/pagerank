function [ matrix ] = deleteedge(matrix, from, to)
    matrix(from,to) = 0;
end

