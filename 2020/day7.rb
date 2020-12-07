# https://adventofcode.com/2020/day/7

def find_inner(bags, name)
  bags[name] | bags[name].map { |n| find_inner(bags, n) }.flatten
end

def count_inner(bags, name)
  bags[name].sum { |n, count| count * (count_inner(bags, n) + 1) }
end

# reverse relationship of bags, then perform search with :shiny_gold as the parent
def part1(bags)
  reversed = Hash.new { |hash, key| hash[key] = [] }
  bags.each do |name, inner|
    inner.each { |n, _| reversed[n] << name }
  end
  find_inner(reversed, :shiny_gold).count
end

def part2(bags)
  count_inner(bags, :shiny_gold)
end

lines = File.open('inputs/day7.txt').map { |line| line.chomp(".\n") }

# parses input into dictionary of bags
# -> { shiny_gold: { drab_silver: 2, shiny_salmon: 3 }, shiny_salmon: {} } }
bags = lines.to_h do |line|
  outer, inner = line.split(" bags contain ")
  inner = inner.gsub('no other bags', '').split(/bag[s|,.]*/).reject(&:empty?)

  inner_bags = inner.to_h do |s|
    words = s.split(/[., ]/).reject(&:empty?)
    [words.drop(1).join('_').to_sym, words[0].to_i]
  end
  [outer.gsub(' ', '_').to_sym, inner_bags]
end

puts part1(bags)
puts part2(bags)
