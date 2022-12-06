function solution_part1()
    scores = Dict(['A' => 1, 'B' => 2, 'C' => 3, 'X' => 1, 'Y' => 2, 'Z' => 3])
    score = 0
    for line in eachsplit(readchomp("input.txt"), '\n')
        opponent_value, mine_value = scores[line[1]], scores[line[3]]
        if opponent_value == 3 && mine_value == 1
            opponent_value = 0
        end
        if opponent_value == 1 && mine_value == 3
            opponent_value = 4
        end
        result_score = (sign(mine_value - opponent_value) * 3) + 3
        score += mine_value + result_score
    end
    score
end

println(solution_part1())

function solution_part2()
    scores = Dict(['A' => 1, 'B' => 2, 'C' => 3, 'X' => 0, 'Y' => 3, 'Z' => 6])
    score = 0
    for line in eachsplit(readchomp("input.txt"), '\n')
        opponent_value, result_score = scores[line[1]], scores[line[3]]
        mine_value = 0

        if result_score == 0
            mine_value = opponent_value - 1
            if mine_value == 0
                mine_value = 3
            end
        elseif result_score == 6
            mine_value = opponent_value + 1
            if mine_value == 4
                mine_value = 1
            end
        else
            mine_value = opponent_value
        end
        score += mine_value + result_score
    end
    score
end

println(solution_part2())