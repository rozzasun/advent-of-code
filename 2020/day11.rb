# https://adventofcode.com/2020/day/11

ADJACENTS = [
  [-1, -1], [0, -1], [1, -1],
  [-1, 0], [1, 0],
  [- 1, 1], [0, 1], [1, 1]
]

def part1(grid)
  prev, cur = grid.clone.map { |r| r.clone }, grid.clone.map { |r| r.clone }
  xy = [*0..grid.size - 1].product([*0..grid[0].size - 1])
  loop do
    count = 0

    xy.each do |x, y|
      letter = prev[x][y]
      around = ADJACENTS.map do |i, j|
        next if x + i < 0 || y + j < 0
        prev[x + i]&.[](y + j)
      end.compact.count('#')
  
      if letter == "L" && around == 0
        cur[x][y] = "#"
      elsif letter == "#" && around >= 4
        cur[x][y] = "L" 
      end
    end

    if prev.eql? cur
      return cur.flatten.count('#')
    else
      occ = 0
      prev = cur.clone.map { |r| r.clone }
    end
  end
end

def part2(grid)
  changed = false
  occ = 0
  chart = {}
  prev, cur = grid.clone.map { |r| r.clone }, grid.clone.map { |r| r.clone }
  loop do
    count = 0

    [*0..grid.size - 1].product([*0..grid[0].size - 1]) do |x, y|
      around = ADJACENTS.map do |i, j|
        row, col = x + i, y + j
        val = nil
        loop do
          if row > -1 && col > -1 && prev[row]&.[](col)
            unless prev[row][col] == '.'
              val = prev[row][col]
              break val
            end
          else
            break val
          end
          row += i
          col += j
        end
      end.compact

      if prev[x][y] == "L" && around.none?("#")
        cur[x][y] = "#" 
        changed = true
      elsif prev[x][y] == "#" && around.count("#") >= 5
        cur[x][y] = "L" 
        changed = true
      end
    end

    if changed
      occ = 0
      changed = false
      prev = cur.clone.map { |r| r.clone }
    else
      return cur.flatten.count('#')
    end
  end
end

grid = File.open('inputs/day11.txt').map do |line|
  line.chomp.chars
end

require 'benchmark'

puts Benchmark.measure {
  puts(part1(grid))
}
puts Benchmark.measure {
  puts(part2(grid))
}
