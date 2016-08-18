function [x, y] = getGuessFor(availableCell)
% Get player's guess
%   promise: x in 1:WIDTH and y in 1:HEIGHT and availableCell(x, y)
    global WIDTH;    
    global HEIGHT;
    
    previouslySelected = true;
    while previouslySelected
        x = getInteger('X: ', 1, WIDTH);
        y = getInteger('Y: ', 1, HEIGHT);
        previouslySelected = ~availableCell(x, y);
        if previouslySelected
            disp('Cell already selected! Please select another')
        end
    end
end

