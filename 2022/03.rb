def part1(lines)
    h = lines.map { |l| l.chars.each_slice(l.size / 2).map(&:join) }
    h.sum do |a, b|
        n = (b.chars & a.chars).first.ord
        if n > 96
            n - 96
        else
            n - 38
        end
    end
end

def part2(lines)
    lines.each_slice(3).to_a.sum do |a, b, c|
        n = (a.chars & b.chars & c.chars).first.ord
        if n > 96
            n - 96
        else
            n - 38
        end
    end

end

lines = File.read('inputs/03.txt').split("\n")

puts(part1(lines))
puts(part2(lines))