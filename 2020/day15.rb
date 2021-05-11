# https://adventofcode.com/2020/day/15

def count_at(lines, num)
  indices = Hash.new { |hash, key| hash[key] = [] }
  lines.each_with_index { |l, i| indices[l] << i }
  i = lines.size
  cur = lines.last
  (num - lines.size).times do
    if indices[cur].size < 2
      cur = 0
      indices[0] << i
    else
      num = i - indices[cur][-2] - 1
      cur = num
      indices[num].shift unless indices[cur][2].nil?
      indices[num] << i
    end
    i += 1
  end
  cur
end

def part1(lines)
  count_at(lines, 2020)
end

def part2(lines)
  count_at(lines, 30000000)
end

lines = File.read('inputs/day15.txt').chomp.split(',').map(&:to_i)

puts(part1(lines))
puts(part2(lines))
