# https://adventofcode.com/2020/day/16

def part1(ranges, nearby)
  all_ranges = ranges.values.flatten
  nearby.flatten.sum do |n|
    all_ranges.any? { |r| r.include?(n) } ? 0 : n
  end
end

def part2(ranges, nearby, mine)
  valid_tickets = nearby.reject do |nums|
    nums.any? { |n| ranges.values.flatten.none? { |r| r.include?(n) } }
  end

  order = [*0..ranges.size - 1].map do |i|
    ranges.keys.select do |key|
      valid_tickets.all? do |nums|
        ranges[key].any? { |range| range.include?(nums[i]) }
      end
    end
  end

  loop do
    ones = order.select(&:one?).flatten
    order.map! { |keys| keys.one? ? keys : keys - ones }
    break if order.all?(&:one?)
  end

  order.flatten.each_with_index.map do |key, i|
    key.to_s.start_with?("departure") ? mine[i] : 1
  end.inject(:*)
end

ranges, mine, nearby = File.read('inputs/day16.txt')
  .split("\n\n")
  .map { |group| group.split("\n") }

ranges = ranges.to_h do |line|
  name, rs = line.split(": ")
  rs = rs.split(" or ").map { |s| Range.new(*s.split("-").map(&:to_i)) }
  [name.to_sym, rs]
end

mine = mine.last.split(",").map!(&:to_i)

nearby = nearby[1..-1].map { |line| line.split(",").map(&:to_i) }

puts(part1(ranges, nearby))
puts(part2(ranges, nearby, mine))
