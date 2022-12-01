file = read("input.txt", String)
file = [map(x->parse(Int, x), split(x, "\n")) for x in split(file, "\n\n")]
sums = []
for elf in file
    push!(sums, sum(elf))
end
sort!(sums)
println(sums[end])
println(sums[end] + sums[end-1] + sums[end-2])