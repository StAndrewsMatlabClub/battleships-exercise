function [x, y, orientation] = getShipPosition(board, shipSize)
% Get ship position and orientation for a ship of shipSize
%   promise: will not overlap any other ship
    global WIDTH;
    global HEIGHT;
    while true
        disp(displayShipsOn(board));
        fprintf('Enter position and orientation for ship of size: %d\n', shipSize);
        x = getInteger('X: ', 1, WIDTH);
        y = getInteger('Y: ', 1, HEIGHT);
        orientation = getOrientation();
        if isShipPartiallyOffgrid(x, y, orientation, shipSize)
            disp('Ship is partially off-grid: please retry');
            continue;
        end
        if isShipOverlappingAnother(board, x, y, orientation, shipSize)
            disp('Already occupied by another ship: please retry');
        else
            break;
        end
    end
    clc;
end

% have opted to make functions that getShipPostion uses as 'private', rather than
% nested, since the function is already 'busy' and there's only minimal loss in parameter passing

function result = getOrientation()
% Get orientation of 'h' or 'v' from player
    while true
        result = input('Enter orientation (h or v): ', 's');
        if strncmpi(result, 'h', 1) == 0 && strncmpi(result, 'v', 1) == 0
            disp('Invalid input: please retry');
            continue;
        end
        break;
    end
    result = lower( result(1) );
end

function result = isShipOverlappingAnother(board, x, y, orientation, size)
    result = false;
    if strcmp(orientation, 'h') == 1
        for n = 0:(size-1)
            if occupiedGridRef(x + n, y)
                result = true;
                break;
            end
        end
    else
        for n = 0:(size-1)
            if occupiedGridRef(x, y + n)
                result = true;
                break;
            end
        end
    end

    function result = occupiedGridRef(x, y)
       result = (strcmp(func2str(board(x, y).gridRef), '@()MISS') == 0);
    end
end

function result = isShipPartiallyOffgrid(x, y, orientation, shipSize)
    global WIDTH;
    global HEIGHT;
    if strcmp(orientation, 'h')
        result = (x + shipSize - 1 > WIDTH);
    else
        result = (y + shipSize - 1 > HEIGHT);
    end
end
