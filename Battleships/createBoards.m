function result = createBoards(numRows, numColumns)
% Create boards for both players
%   boards consist of a 2D grid of function callbacks: either miss or ship
    global MISS;
    player = struct;
    % we (appear to) need to use struct instead of array as we can't assign 
    % function handles to an array after its definition,
    % and we need to do so when the ships are placed
    player(1).board = struct;
    player(2).board = struct;
    initBoardFor(1);
    initBoardFor(2);
    result = player;

    function initBoardFor(playerNum)
    % initialise board to a grid of anonymous miss functions
        for x = 1:numColumns
            for y = 1:numRows
                player(playerNum).board(x, y).gridRef = @()MISS;
            end
        end
    end
end

