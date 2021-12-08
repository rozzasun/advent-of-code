def part1(lines)
  lines.map do |_, outputs|
    outputs.count { |st| [2, 4, 3, 7].include?(st.length) }
  end.sum
end

def part2(lines)
  lines.map do |inputs, outputs|
    m = []
    m[1] = inputs.find { |st| st.size == 2 }
    m[4] = inputs.find { |st| st.size == 4 }
    m[7] = inputs.find { |st| st.size == 3 }
    m[8] = inputs.find { |st| st.size == 7 }
    inputs.each do |st|
      if st.size == 5
        if ((st.chars & m[1].chars).count == 2)
          m[3] = st
        elsif ((st.chars & m[4].chars).count == 2)
          m[2] = st
        else
          m[5] = st
        end
      elsif st.size == 6
        if ((st.chars & m[4].chars).count == 4)
          m[9] = st
        elsif ((st.chars & m[7].chars).count == 3)
          m[0] = st
        else
          m[6] = st
        end
      end
    end

    m.map! { |x| x.chars.sort.join }
    outputs.map { |st| m.find_index(st.chars.sort.join) }.join.to_i
  end.sum
end

lines = File.open('inputs/08.txt').map { |line| line.split(" | ").map { |x| x.split(" ") } }

puts(part1(lines))
puts(part2(lines))