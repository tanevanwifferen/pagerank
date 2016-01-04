function [ transitions ] = addteleport(transitions, alpha)
    transitions = (transitions / (1 - alpha)) + 1;
    transitions = transitions .* abs(eye(size(transitions,1)) - 1);
    transitions = transitions / diag(sum(transitions));
end

