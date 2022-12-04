def part1(ranges_pairs)
    ranges_pairs.count do |x, y|
        x.cover?(y) || y.cover?(x)
    end
end

def part2(ranges_pairs)
    ranges_pairs.count do |x, y|
        !(x.to_a & y.to_a).empty?
    end
end

ranges_pairs = File.read('inputs/04.txt').split("\n").map do
    |l| l.split(",").map do |s|
        a, b = s.split("-")
        (a.to_i..b.to_i)
    end
end

puts(part1(ranges_pairs))
puts(part2(ranges_pairs))