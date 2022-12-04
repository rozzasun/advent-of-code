def part1(groups)
    groups.map { |i| i.sum }.max
end

def part2(groups)
    groups.map { |i| i.sum }.sort.last(3).sum
end

c = File.read('inputs/01.txt').split("\n\n")
groups = c.map { |k| k.split("\n").map(&:to_i) }

puts(part1(groups))
puts(part2(groups))