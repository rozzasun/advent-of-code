def part1(nums)
  a, b = nums.minmax
  a.upto(b).map do |i|
    nums.sum { |n| (n - i).abs }
  end.min
end

def part2(nums)
  a, b = nums.minmax
  a.upto(b).map do |i|
    nums.sum { |n| c = (n - i).abs; (c * (c + 1)) / 2 }
  end.min
end

nums = File.read('inputs/07.txt').split(",").map(&:to_i)

puts(part1(nums))
puts(part2(nums))