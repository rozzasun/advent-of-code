def part1(lines)
  gamma = lines.transpose.map do |col|
    col.count("1") > lines.count / 2 ? 1 : 0
  end
  epsilon = gamma.map { |val| val == 0 ? 1 : 0 }
  gamma.join.to_i(2) * epsilon.join.to_i(2)
end

def rating(lines, default_bit, other_bit)
  lines[0].count.times do |i|
    compared = lines.transpose[i].count("1") <=> lines.count / 2.0
    keep = compared == -1 ? other_bit : default_bit

    lines.reject! { |line| line[i] != keep }
    break if lines.count == 1
  end
  lines[0].join.to_i(2)
end

def part2(lines)
  rating(lines.dup, "1", "0") * rating(lines.dup, "0", "1")
end

lines = File.open('inputs/03.txt').map { |line| line.chomp.chars }

puts(part1(lines))
puts(part2(lines))