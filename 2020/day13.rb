# https://adventofcode.com/2020/day/13

def part1(lines)
  min = lines[0].to_i
  times = lines[1].split(',')

  id, time = Float::INFINITY, Float::INFINITY
  times.each do |i|
    next if i == "x"
    i = i.to_i

    if (min / i.to_f).ceil * i - min < time
      time = (min / i.to_f).ceil * i - min
      id = i
    end
  end
  id * time
end

def mod_inv(a, c)
  c.times { |i| return i if (a * i) % c == 1 }
end

def part2(lines)
  ts = lines[1].split(',').map(&:to_i)
  ids = {}
  ts.each_with_index do |t, i|
    next if t == 0
    ids[t.to_i] = t - i
  end

  remainder_product = ids.keys.inject(:*)
  vals = ids.map do |k, v|
    [v, remainder_product / k, mod_inv(remainder_product / k, k)]
  end

  vals.sum { |a| a.inject(:*) } % remainder_product
end

lines = File.open('inputs/day13.txt').map { |line| line.chomp }

puts(part1(lines))
puts(part2(lines))
