# https://adventofcode.com/2020/day/3

def trees(grid, r, d)
  x, y = r, d
  i = 0
  while y < grid.length do
    x = x % (grid[0].length)
    i += 1 if grid[y][x] == '#'
    x += r
    y += d
  end
  i
end

def part1(grid)
  trees(grid, 3, 1)
end

def part2(grid)
  [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    .map { |dir| trees(grid, *dir) }
    .inject(:*)
end

grid = File.open('inputs/day3.txt').map { |line| line.chomp.chars }

puts part1(grid)
puts part2(grid)
