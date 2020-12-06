# https://adventofcode.com/2020/day/4

VALID_HEX = "0123456789abcdef".chars
RULES = {
  byr: -> (val) { is_num_between?(val, 1920, 2002) },
  iyr: -> (val) { is_num_between?(val, 2010, 2020) },
  eyr: -> (val) { is_num_between?(val, 2020, 2030) },
  hgt: -> (val) {
    unit = val.chars.last(2).join
    height = val.chars.first(val.length - 2).join
    case unit
    when "in"
      is_num_between?(height, 59, 76)
    when "cm"
      is_num_between?(height, 150, 193)
    else
      false
    end
  },
  hcl: -> (val) {
    val[0] == "#" && val.size == 7 &&
      (val.chars.last(6) - VALID_HEX).empty?
  },
  ecl: -> (val) {
    %w(amb blu brn gry grn hzl oth).include?(val)
  },
  pid: -> (val) {
    is_num_between?(val, 0, 999999999) && val.length == 9
  }
}

def is_num_between?(str, s, e)
  !!(str =~ /\A[-+]?[0-9]+\z/) && (s..e).include?(str.to_i)
end

def part1(passports)
  passports.count { |passport| (RULES.keys - passport.keys).empty? }
end

def part2(passports)
  passports.count do |passport|
    next if !(RULES.keys - passport.keys).empty?
    RULES.all? { |rule, func| func.call(passport[rule]) }
  end
end

passports = File.read('inputs/day4.txt').split("\n\n").map do |group|
  group.split(/[\n ]/).to_h do |line|
    key, val = line.split(":")
    [key.to_sym, val]
  end
end

puts part1(passports)
puts part2(passports)
