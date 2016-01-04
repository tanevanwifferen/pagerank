function [ matrix ] = deletenode(matrix, index)
    matrix(index,:) = [];
    matrix(:,index) = [];
end

