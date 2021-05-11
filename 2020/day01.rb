def part1(lines)
  lines.each_with_index do |num, i|
    return (2020 - num) * num if lines[0..i].include?(2020 - num)
  end
end

def part2(lines)
  lines.combination(3).find { |c| c.sum == 2020 }.reduce(:*)
end

lines = File.open('inputs/day1.txt').map { |line| line.chomp.to_i }

puts(part1(lines))
puts(part2(lines))
