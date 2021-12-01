def part1(lines)
  lines.each_cons(2).count { |a, b| b > a }
end

def part2(lines)
  lines.each_cons(4).count do |a, b, c, d|
    b + c + d > a + b + c
  end
end

lines = File.open('inputs/01.txt').map { |line| line.chomp.to_i }

puts(part1(lines))
puts(part2(lines))