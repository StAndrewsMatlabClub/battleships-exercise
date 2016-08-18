function result = notifyFleetSunk(player)
    global fleetSunk;
    result = @notify;
    
    function notify
        fleetSunk = true;
        fprintf('Player %d''s fleet has been sunk!\n', player);
    end
end

