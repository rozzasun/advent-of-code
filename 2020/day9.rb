# https://adventofcode.com/2020/day/9

def part1(nums)
  (25..nums.size - 1).each do |i|
    range = (i - 25)..(i - 1)
    sums = nums[range].combination(2).map(&:sum)
    return nums[i] if !sums.include?(nums[i])
  end
end

GOAL = 26796446
def part2(nums)
  [*0..nums.size - 1].combination(2) do |i, j|
    return nums[i..j].minmax.sum if nums[i..j].sum == GOAL
  end
end

nums = File.open('inputs/day9.txt').map { |line| line.chomp.to_i }

puts part1(nums)
puts part2(nums)
