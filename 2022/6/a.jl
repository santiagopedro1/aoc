input = readchomp("input.txt")

function findMarkerStart(input, len)
    for i in 1:length(input)-len+1
        marker = input[i:i+len-1]
        if length(Set(marker)) == len
            return i + len - 1
        end
    end
end

# Part 1
findMarkerStart(input, 4) |> println

# Part 2
findMarkerStart(input, 14) |> println