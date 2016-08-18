function board = buildFleet(board, fleetSunk)
% Build fleet on board
%   variables used within closures have trailing '_'
    SHIPS = [5, 4, 3, 3, 2];
    % all ships share the same fleetSize_ variable
    fleetSize_ = length(SHIPS);
    for i = 1:length(SHIPS)
        [x, y, orientation] = getShipPosition(board, SHIPS(i));
        board = buildShip(board, x, y, orientation, SHIPS(i));
    end
    disp(displayShipsOn(board));
    disp('All ships placed: press any key to continue');
    pause;
    clc;

    function result = buildShip(board, x, y, orientation, size)
    % Build ship of size on board at (x,y) with orientation ('h' or 'v').
    %   require: ~isShipOverlappingAnother(x, y, orientation, size)
    %   promise: same ship function handle assigned to each gridRef of a ship
        global HIT;
        % each ship has its own damage_ variable, i.e., a ship's gridRefs share this variable
        damage_ = size;
        for n = 0:(size-1)
            if strcmp(orientation, 'h') == 1
                board(x + n, y).gridRef = @ship;
            else
                board(x, y + n).gridRef = @ship;
            end
        end
        result = board;

        function result = ship
        % Invoked when player selects a gridRef that isn't a miss
            result = HIT;
            if damage_ > 0
                damage_ = damage_ - 1;
                if damage_ == 0
                    fleetSize_ = fleetSize_ - 1;
                    fprintf('Ship sunk! (%d of %d)\n', length(SHIPS) - fleetSize_, length(SHIPS));
                    if fleetSize_ == 0
                        fleetSunk();
                    end
                end
            end
        end
    end
end

