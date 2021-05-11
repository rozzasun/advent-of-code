# https://adventofcode.com/2020/day/10

def combos(i, nums, total = {})
  return 1 if i == nums.size - 1

  (i + 1..i + 3).sum do |j|
    next 0 unless nums[j] && nums[j] - nums[i] <= 3
    total[j] ||= combos(j, nums, total)
    total[j]
  end
end

def part1(nums)
  threes, ones = 1, 0
  dup = [0, *nums]
  while dup.size > 1
    case dup[1] - dup.shift
    when 1 then ones += 1
    when 3 then threes += 1
    end
  end
  threes * ones
end

def part2(nums)
  combos(0, [0, *nums])
end

nums = File.open('inputs/day10.txt').map { |line| line.chomp.to_i }.sort

puts part1(nums)
puts part2(nums)
