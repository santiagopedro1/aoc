input=readlines("input.txt")

function part1()
    d = Dict("U" => 1im, "D" => -1im, "L" => -1, "R" => 1)
    rope = fill(0 + 0im, 10)
    s1, s2 = Set([rope[2]]), Set([rope[end]])

    for line in input
        dir, steps = split(line)

        for _ in 1:parse(Int, steps)
            for i in eachindex(rope)
                if i == 1
                    rope[i] += d[dir]
                    continue
                end

                diff = rope[i - 1] - rope[i]
                if abs(diff) >= 2
                    if abs(real(diff)) > 0
                        rope[i] += Complex(real(diff) / abs(real(diff)), 0)
                    end
                    if abs(imag(diff)) > 0
                        rope[i] += Complex(0, imag(diff)/abs(imag(diff)))
                    end
                end
            end
            push!(s1, rope[2])
            push!(s2, rope[end])
        end
    end
    println(s1)
    return length(s1), length(s2)
end

println(part1())