
DEPTH = {
  "down" => 1,
  "up" => -1
}

def part1(lines)
  h, d = 0, 0
  lines.each do |w, n|
    n = n.to_i
    if w == "forward"
      h += n
    else
      d += n * DEPTH[w]
    end
  end
  d * h
end

def part2(lines)
  h, d, aim = 0, 0, 0
  lines.each do |w, n|
    n = n.to_i
    if w == "forward"
      h += n
      d +=  aim * n
    else
      aim += n * DEPTH[w]
    end
  end
  d * h
end

lines = File.open('inputs/02.txt').map { |line| line.split(' ') }

puts(part1(lines))
puts(part2(lines))