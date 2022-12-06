real_input = readchomp("input.txt")

struct Movement
    amount::Int8
    from::Int8
    to::Int8
end

const State = Vector{Vector{Char}}
const Movements = Vector{Movement}

function parse(input::AbstractString)::Tuple{State, Movements}
    stackss, movements = split(input, "\n\n")
    stackrows = split(stackss, '\n')
    stacknum = ints(pop!(stackrows))[end]
    stacks::State = [[] for _ in 1:stacknum]
    reverse!(stackrows)
    for row in stackrows
        for i in 2:4:length(row)
            if row[i] != ' '
                col::Int8 = (i+2)/4
                push!(stacks[col], row[i])
            end
        end
    end
    (stacks, Iterators.partition(ints(movements), 3) .|> x->Movement(x...))
end

function move1!(state::State, from, to)
    c = pop!(state[from])
    push!(state[to], c)
end

function part1(input::AbstractString)::AbstractString
    stacks, movements = parse(input)
    for mov in movements
        for _ in 1:mov.amount
            move1!(stacks, mov.from, mov.to)
        end
    end
    stacks .|> pop! |> String
end
println(part1(real_input))

function part2(input::AbstractString)::AbstractString
    stacks, movements = parse(input)
    for mov in movements
        temp::Vector{Char} = []
        for _ in 1:mov.amount
            push!(temp, pop!(stacks[mov.from]))
        end
        reverse!(temp)
        append!(stacks[mov.to], temp)
    end
    stacks .|> pop! |> String
end
println(part2(real_input))
