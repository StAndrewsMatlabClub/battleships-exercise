function result = displayShipsOn(board)
% generate a display for all the ships currently on the board
    global WIDTH;
    global HEIGHT;
    global EMPTY;
    global SHIP;
    result = zeros(WIDTH, HEIGHT);
    for x = 1:WIDTH
        for y = 1:HEIGHT
            if (strcmp(func2str(board(x, y).gridRef), '@()MISS') == 1)
                result(y, x) = EMPTY;
            else
                result(y, x) = SHIP;
            end
        end
    end
    result = char(result);
end

