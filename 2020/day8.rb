# https://adventofcode.com/2020/day/8

def acc(lines)
  visited = []
  cur, value = 0, 0
  loop do
    return [value, false] if visited.include?(cur)
    return [value, true] if cur >= lines.size

    visited << cur
    case lines[cur][0]
    when :jmp then cur += lines[cur][1] - 1
    when :acc then value += lines[cur][1]
    end
    cur += 1
  end
end

def part1(lines)
  acc(lines)[0]
end

def part2(lines)
  lines.each_with_index do |line, index|
    next if line[0] == :acc

    dup = lines.map(&:clone)
    dup[index][0] = (line[0] == :jmp) ? :nod : :jmp

    value, finished = acc(dup)
    return value if finished
  end
end

lines = File.open('inputs/day8.txt').map { |line| line.chomp }
lines.each_with_index do |val, index|
  action, num = val.split(' ')
  lines[index] = [action.to_sym, num.to_i]
end

puts part1(lines)
puts part2(lines)
