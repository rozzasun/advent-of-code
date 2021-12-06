def part1(lines)
  grid = Hash.new { |h, k| h[k] = 0 }
  lines.each do |to, from|
    (to[0] == from[0] || to[1] == from[1]) && mark_path(to, from, grid)
  end
  grid.values.count { |val| val >= 2 }
end

def part2(lines)
  grid = Hash.new { |h, k| h[k] = 0 }
  lines.each { |to, from| mark_path(to, from, grid) }
  grid.values.count { |val| val >= 2 }
end

def mark_path((x2, y2), (x1, y1), grid)
  x_dir, y_dir = x2 <=> x1, y2 <=> y1

  i = 0
  while true do
    x = x1 + i * x_dir
    y = y1 + i * y_dir

    grid[[x, y]] += 1
    break if [x, y] == [x2, y2]
    i += 1
  end
end

lines = File.open('inputs/05.txt').map do |line|
  line.chomp.split(" -> ").map { |xy| xy.split(",").map(&:to_i) }
end

puts(part1(lines))
puts(part2(lines))