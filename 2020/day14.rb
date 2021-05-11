# https://adventofcode.com/2020/day/14

def part1(lines)
  mask, given = 0, 0
  mem = {}

  lines.each do |line|
    if line[0..3] == "mask"
      mask = line.split(" ")[-1]
    else
      given = ~mask.gsub("0", "1").gsub("X", "0").to_i(2)
      address = line.split(/[\[\]]/)[1].to_i
      num = line.split(" = ")[-1].to_i
      mem[address] = (given & num) + mask.gsub("X", "0").to_i(2)
    end
  end
  mem.values.sum
end

def part2(lines)
  mask, given = 0, 0
  mem = {}

  lines.each do |line|
    if line[0..3] == "mask"
      mask = line.split(" ")[-1]
    else
      given = line.split(/[\[\]]/)[1].to_i
      val = line.split(" = ")[-1].to_i
      (0..2 ** mask.count("X") - 1).to_a.each do |i|
        address = "%036d" % (mask.gsub("X", "0").to_i(2) | given).to_s(2)

        bits = ("%0#{mask.count("X")}d" % i.to_s(2)).chars
        temp = mask.dup

        bits.each do |s|
          address[temp.index('X')] = s
          temp.sub!('X', s)
        end

        mem[address.to_i(2)] = val
      end
    end
  end
  mem.values.sum
end

lines = File.open('inputs/day14.txt').map { |line| line.chomp }

puts(part1(lines))
puts(part2(lines))
