def part1(lines)
  grid = Hash.new { |h, k| h[k] = 0 }
  lines.each do |to, from|
    if to[0] == from[0] || to[1] == from[1]
      mark_path(to, from, grid)
    end
  end
  grid.values.count { |val| val >= 2 }
end

def part2(lines)
  grid = Hash.new { |h, k| h[k] = 0 }
  lines.each { |to, from| mark_path(to, from, grid) }
  grid.values.count { |val| val >= 2 }
end

def mark_path(to, from, grid)
  x_dir = (diff = to[0] - from[0]) == 0 ? 0 : diff/diff.abs
  y_dir = (diff = to[1] - from[1]) == 0 ? 0 : diff/diff.abs

  steps = [(from[0] - to[0]).abs, (from[1] - to[1]).abs].max + 1
  steps.times do |i|
    x = from[0] + i * x_dir
    y = from[1] + i * y_dir

    grid[[x, y]] += 1
  end
end

lines = File.open('inputs/05.txt').map do |line|
  line.chomp.split(" -> ").map { |xy| xy.split(",").map(&:to_i) }
end

puts(part1(lines))
puts(part2(lines))