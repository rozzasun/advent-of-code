# https://adventofcode.com/2020/day/6

def part1(groups)
  groups.sum { |l| l.flatten.uniq.size }
end

def part2(groups)
  groups.sum { |l| l.inject(:&).uniq.size }
end

groups = File.read('inputs/day6.txt')
  .split("\n\n")
  .map { |str| str.split("\n").map(&:chars) }

puts part1(groups)
puts part2(groups)
