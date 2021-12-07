def part1(lines)
  80.times do
    zeroes = lines.count(0)
    lines.map! do |i|
      i == 0 ? 6 : i - 1
    end
    lines += [8] * zeroes
  end
  lines.count
end

def part2(lines)
  arr = 9.times.map { |i| lines.count(i) }

  256.times do
    zeroes = arr.shift
    arr[6] += zeroes
    arr << zeroes
  end
  arr.sum
end

list = File.read('inputs/06.txt').chomp.split(",").map(&:to_i)

puts(part1(list.dup))
puts(part2(list))