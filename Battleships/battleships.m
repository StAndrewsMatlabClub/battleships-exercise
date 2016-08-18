global MISS;
global HIT;
global EMPTY;
global SHIP;
global WIDTH;
global HEIGHT;
global fleetSunk;
MISS = 'O';
HIT = 'X';
EMPTY = '.';
SHIP = '*';
WIDTH = 10;
HEIGHT = 10;
fleetSunk = false;

clc;
attacker = 1;
defender = 2;
player = createBoards(WIDTH, HEIGHT);
% displays are char grids showing what each player can 'see'
player(attacker).display = arrayfun(@(x) EMPTY, zeros(WIDTH, HEIGHT));
player(defender).display = arrayfun(@(x) EMPTY, zeros(WIDTH, HEIGHT));
player(attacker).board = buildFleet(player(attacker).board, notifyFleetSunk(attacker));
player(defender).board = buildFleet(player(defender).board, notifyFleetSunk(defender));

while ~fleetSunk
    fprintf('Player %d''s turn\n', attacker);
    player(attacker).display = playerTurn(player(attacker).display, player(defender).board);
    temp = attacker;
    attacker = defender;
    defender = temp;
end

