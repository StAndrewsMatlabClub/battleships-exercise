function playersDisplay = playerTurn(playersDisplay, otherPlayersBoard)
% Player's turn consisting of input (x,y) and outcome applied to board and shown on display
    global EMPTY;
    disp(playersDisplay);
    [x, y] = getGuessFor(@(x,y) playersDisplay(y,x) == EMPTY);
    clc;
    % note reversed coord system for display
    playersDisplay(y, x) = otherPlayersBoard(x, y).gridRef();
    disp(playersDisplay);
    disp('Press any key to continue');
    pause;
    clc;
end

