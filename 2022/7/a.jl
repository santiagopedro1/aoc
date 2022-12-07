function day7()
    paths = [""]
    sizes = Dict{String,Int64}()
    part2 = 40_000_000

    for line in eachline("input.txt")
        if startswith(line, "\$ cd ..")
            pop!(paths)
        elseif startswith(line, "\$ cd ")
            push!(paths, "$(last(paths))/$line")
        elseif isdigit(line[1])
            size = parse(Int, split(line, " ")[1])
            part2 -= size
            for path in paths
                sizes[path] = get(sizes, path, 0) + size
            end
        end
    end
    vals = collect(values(sizes))

    println("Part 1: ", sum(filter(i -> i < 100_000, vals)))

    println("Part 2: ", minimum(filter(i -> i ≥ flipsign(part2, -1), vals)))
end

day7()