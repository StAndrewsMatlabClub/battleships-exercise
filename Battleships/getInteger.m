function result = getInteger(prompt, min, max)
% Get integer from console using prompt and in range min..max
    while true
        result = int64(input(prompt));
        if result < min || result > max
            disp('Invalid input; please retry');
            continue;
        end
        break;
    end
end

