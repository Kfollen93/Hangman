class Game
  attr_accessor :board

  def setup
  p  word = choose_word # reminder, this is the method "choose_word"
    @word = word # Added this to access it in lose statement.
    @board = Board.new(word)
    @used_letters = []
  end

  def dictionary
    File.readlines("5desk.txt", chomp: true) # chomp is an additional parameter to readlines. Removes the \n.
  end

  def choose_word
    word = dictionary.select { |word| word.length.between?(5, 12) }.sample
    chosen_word = word.downcase
    chosen_word
  end

  def start
    puts " "
    1.upto(6) do |i| # This will need to be changed to IF the letter is correct, it doesn't count as a turn
      puts "Turn #{i}: Type in one letter and press 'Enter'."
      @guess = gets.chomp
      until @guess =~ /\A[a-z]{1}\z/ && !@used_letters.include?(@guess)
        puts 'Your guess must be one lowercase letter and not used before.'
        @guess = gets.chomp
      end
      puts " "
      board.update(@guess)
      puts " "
      puts " "
      p @used_letters.push(@guess)
      game_over?
      if i >= 6
        puts "You lose. The word was: #{@word}."
      end
    end
  end


  def game_over?
    if board.full?
      puts "Good job, you won!"
    end
  end
end

