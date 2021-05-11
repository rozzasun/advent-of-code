# https://adventofcode.com/2020/day/18

def calc(arr)
  tot = arr[0]
  cur = ''

  arr[1..-1].each do |a|
    if a.to_i.to_s == a
      tot = eval("#{tot} #{cur} #{a}")
    else
      cur = a
    end
  end
  tot.to_s
end

def weird(arr)
  tot = arr.clone[0]
  cur = ''

  loop do
    return calc(arr) if !arr.index('+')
      
    ind = arr.index('+')
    start = ind == 1 ? [] : arr[0..ind - 2]
    e = ind == arr.size - 2 ? [] : arr[ind + 2..-1]
    arr = start + [(arr[ind - 1].to_i + arr[ind + 1].to_i).to_s] + e
  end
end

def part1(lines)
  lines.sum do |line|
    eq = line.chars.reject { |c| c == ' ' }
    loop do
      break calc(eq).to_i if !eq.index(')')

      middle = []
      (eq.index(')') - 1).downto(0).each do |i|
        if eq[i] == ('(')
          start = i == 0 ? [] : eq[0..i - 1]
          eq = start + [calc(middle.reverse)] + eq[eq.index(')') + 1..-1]
          break
        else
          middle << eq[i]
        end
      end
    end
  end
end

def part2(lines)
  lines.sum do |line|
    eq = line.chars.reject { |c| c == ' ' }
    loop do
      if !eq.index(')')
        break weird(eq).to_i
      end

      middle = []
      (eq.index(')') - 1).downto(0).each do |i|
        if eq[i] == ('(')
          start = i == 0 ? [] : eq[0..i - 1]
          eq = start + [weird(middle.reverse)] + eq[eq.index(')') + 1..-1]
          break
        else
          middle << eq[i]
        end
      end
    end
  end
end

lines = File.open('inputs/day18.txt').map { |line| line.chomp }

puts(part1(lines))
puts(part2(lines))
