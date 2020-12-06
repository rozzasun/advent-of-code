# https://adventofcode.com/2020/day/5

def part1(ids)
  ids.max
end

def part2(ids)
  ids = ids.sort
  (ids[0]..ids[-1]).to_a - ids
end

lines = File.open('inputs/day5.txt').map(&:chomp)

ids = lines.map do |l|
  row = l[0..7].gsub('F', '0').gsub('B', '1').to_i(2)
  col = l[7..-1].gsub('L', '0').gsub('R', '1').to_i(2)
  row * 8 + col
end

puts part1(ids)
puts part2(ids)
