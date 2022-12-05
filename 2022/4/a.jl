real_input = readchomp("input.txt")

ints(str) = parse.(Int, eachmatch(r"(\d+)", str) .|> only)

within(a, b, c, d) = let x = a:b, y = c:d
    x ⊆ y || y ⊆ x
end

part1(input) = eachsplit(input, '\n') .|> ints .|> (x->within(x...)) |> sum

println(part1(real_input))

overlap(a, b, c, d) = let x = a:b, y = c:d
    !isempty(x ∩ y)
end

part2(input) = eachsplit(input, '\n') .|> ints .|> (x->overlap(x...)) |> sum

println(part2(real_input))