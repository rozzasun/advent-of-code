# https://adventofcode.com/2020/day/12

DIRS = {
  N: [0, 1],
  E: [1, 0],
  S: [0, -1],
  W: [-1, 0],
}

QUAD_R = {
  [-1, 1] => [1, 1],
  [1, 1] => [1, -1],
  [1, -1] => [-1, -1],
  [-1, -1] => [-1, 1],

  [1, 0] => [0, -1],
  [0, -1] => [-1, 0],
  [-1, 0] => [0, 1],
  [0, 1] => [1, 0],
}
Hash[QUAD_R.to_a.reverse]

QUAD_L = 
{
  [-1, 1] => [-1, -1],
  [-1, -1] => [1, -1],
  [1, -1] => [1, 1],
  [1, 1] => [-1, 1],

  [1, 0] => [0, 1],
  [0, -1] => [1, 0],
  [-1, 0] => [0, -1],
  [0, 1] => [-1, 0],
}

def part1(lines)
  vertical, horizontal = 0, 0
  cur = :E

  lines.each do |line|
    act, mag = line[0].to_sym, line[1..-1].to_i
    case act
    when *DIRS.keys
      horizontal += DIRS[act][0] * mag
      vertical += DIRS[act][1] * mag
    when :F
      horizontal += DIRS[cur][0] * mag
      vertical += DIRS[cur][1] * mag
    when :R
      times = mag / 90
      cur = DIRS.keys[(DIRS.keys.index(cur) + times) % 4]
    when :L
      times = mag / 90
      cur = DIRS.keys[(DIRS.keys.index(cur) - times) % 4]
    end
  end

  vertical.abs + horizontal.abs
end

def part2(lines)
  dirs = [:N, :E, :S, :W]
  vertical, horizontal = 0, 0
  w_v, w_h = 1, 10

  lines.each do |line|
    act, mag = line[0].to_sym, line[1..-1].to_i
    case act
    when *DIRS.keys
      w_h += DIRS[act][0] * mag
      w_v += DIRS[act][1] * mag
    when :F
      horizontal += mag * w_h
      vertical += mag * w_v
    when :R
      times = mag / 90
      times.times do |i|
        sign_x, sign_y = w_h <=> 0, w_v <=> 0
        w_h, w_v = w_v, w_h
        w_h = w_h.abs * QUAD_R[[sign_x, sign_y]][0]
        w_v = w_v.abs * QUAD_R[[sign_x, sign_y]][1]
      end
    when :L
      times = mag / 90
      times.times do |i|
        sign_x, sign_y = w_h <=> 0, w_v <=> 0
        w_h, w_v = w_v, w_h
        w_h = w_h.abs * QUAD_L[[sign_x, sign_y]][0]
        w_v = w_v.abs * QUAD_L[[sign_x, sign_y]][1]

      end
    end
  end

  vertical.abs + horizontal.abs
end

lines = File.open('inputs/day12.txt').map { |line| line.chomp }

puts(part1(lines))
puts(part2(lines))
