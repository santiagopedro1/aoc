input = readchomp("input.txt")

function prio(char)
    if 'a' <= char <= 'z'
        1 + char - 'a'
    elseif 'A' <= char <= 'Z'
        27 + char - 'A'
    end
end

function solution_part1(input)
    result = 0
    for line in eachsplit(input, '\n')
        l::Int = length(line)//2
        result += prio(only(Set(line[1:l]) ∩ Set(line[l+1:end])))
    end
    result
end

println(solution_part1(input))

function solution_part2(input)
    result = 0
    for group in Iterators.partition(eachsplit(input, '\n'), 3)
        result += prio(only(Set(group[1]) ∩ Set(group[2]) ∩ Set(group[3])))
    end
    result
end

println(solution_part2(input))