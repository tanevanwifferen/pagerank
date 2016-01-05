function [ transitions ] = createtransitions( matrix )
    div = sum(matrix);
    div(div == 0) = 1; % Replace 0 by 1, because division by 0 gives NaN, but we want 0
    transitions = matrix / diag(div);
end

