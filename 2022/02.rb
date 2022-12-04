def part1(lines)
    lines.sum do |a, b|
        if a == "A"
            if b == "X"
                3 + 1
            elsif b == "Y"
                6 + 2
            elsif b == "Z"
                0 + 3
            end
        elsif a == "B" #paper
            if b == "X"
                0 + 1
            elsif b == "Y"
                3 + 2
            elsif b == "Z"
                6 + 3
            end
        elsif a == "C" #sc
            if b == "X"
                6 + 1
            elsif b == "Y"
                0 + 2
            elsif b == "Z"
                3 + 3
            end
        end
    end
end

def part2(lines)
    r = 1
    p = 2
    s = 3

    lines.sum do |a, b|
        if a == "A" # r
            if b == "X" #lose
                0 + s
            elsif b == "Y" #draw
                3 + r
            elsif b == "Z" #win
                6 + p
            end
        elsif a == "B" #paper
            if b == "X"
                0 + r
            elsif b == "Y"
                3 + p
            elsif b == "Z"
                6 + s
            end
        elsif a == "C" #sc
            if b == "X"
                0 + p
            elsif b == "Y"
                3 + s
            elsif b == "Z"
                6 + r
            end
        end
    end
end

lines = File.open('inputs/02.txt').map { |l| l.split(" ") }

puts(part1(lines))
puts(part2(lines))