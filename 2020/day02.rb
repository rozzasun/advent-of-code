# https://adventofcode.com/2020/day/2

def part1(lines)
  lines.count do |line|
    s, e, letter, password = line.split(/[- :]/).reject(&:empty?)
    (s.to_i..e.to_i).include?(password.count(letter))
  end
end

def part2(lines)
  lines.count do |line|
    s, e, letter, password = line.split(/[- :]/).reject(&:empty?)
    (password[s.to_i - 1] == letter) ^ (password[e.to_i - 1] == letter)
  end
end

lines = File.open('inputs/day2.txt').map { |line| line.chomp }

puts part1(lines)
puts part2(lines)
