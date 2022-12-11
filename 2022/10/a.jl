input=readlines("input.txt")

function part1()
    x = 1
    clock = 0
    soma = 0
    crt = [["." for i in 1:40] for j in 1:6]
    function ciclo()
        clock += 1
        if clock == 20 || clock == 60 || clock == 100 || clock == 140 || clock == 180 || clock == 220
            soma += clock * x
        end
        if abs((clock-1)%40 - x) < 2
            crt[1 + (clock-1)÷40][1 + (clock-1)%40] = "#"
        end
    end
    for line in input
        if line == "noop"
            ciclo()
        else
            add = parse(Int, line[5:end])
            ciclo()
            ciclo()
            x += add
        end
    end
    println(soma)
    for line in crt
        println(join(line, ""))
    end
end

part1()