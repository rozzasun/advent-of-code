def win?(board)
  (board + board.transpose).any?(&:none?)
end

def boards_iter(board_count, size)
  [*0..board_count - 1].product([*0..size], [*0..size])
end

def part1(nums, boards)
  marked = boards.dup
  nums.each do |n|
    boards_iter(boards.count, 4).each do |b, row, col|
      marked[b][row][col] = nil if boards[b][row][col] == n
    end
    winner = marked.find { |board| win?(board) }
    return (winner.flatten.compact.sum) * n if winner
  end
end

def part2(nums, boards)
  marked = boards.dup
  won, last = [], []
  nums.each do |n|
    boards_iter(boards.count, 4).each do |b, row, col|
      next if won.include?(b)
      if boards[b][row][col] == n
        marked[b][row][col] = nil
        last = boards[b]
      end
    end

    won = marked.each_index.select { |b| win?(marked[b]) }
    if won.count == boards.count
      return (last.flatten.compact.sum) * n
    end
  end
end

chunks = File.read('inputs/04.txt').split("\n\n")
nums = chunks.shift.split(",").map(&:to_i)
boards = chunks.map do |board|
  board.split("\n").map { |row| row.split(" ").map(&:to_i) }
end

puts(part1(nums, boards))
puts(part2(nums, boards))