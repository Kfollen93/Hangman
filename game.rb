class Game
  attr_accessor :board

  def setup
    word = choose_word() #this is a method, in Ruby it's usually written WITHOUT (), can remove
    @board = Board.new(word)
    @used_letters = []
  end

  def dictionary
    File.readlines("5desk.txt", chomp: true) # chomp is an additional parameter added to readlines. Removes the \n.
  end

  def choose_word
    word = dictionary.select { |word| word.length.between?(5, 12) }.sample
    chosen_word = word.downcase
    puts chosen_word # Just for testing.
    chosen_word
  end

  def start
    puts " "
    1.upto(6) do |i| # This will need to be changed to IF the letter is correct, it doesn't count as a turn
      puts "Turn #{i}: Type in one letter and press 'Enter'."
      @guess = gets.chomp
      # Regex for guess as a String. && Checks if guess includes a used letter, if it does, it will loop.
      # However, I'm not sure what will happen if it's a correct letter that's entered twice yet.
      until @guess =~ /\A[a-z]{1}\z/ && !@used_letters.include?(@guess) # until used letters do not (!) include guess
        puts 'Your guess must be one lowercase letter and not used before.'
        @guess = gets.chomp
      end
      @board.check_for_correct_guess(@guess) # calls method below to check after each guess
      @board.check_for_wrong_guess(@guess) # calls method below to check after each guess
      #Game.game_over?
      map_blanks # calls method
      if i >= 6
        puts "You lose. The word was: '#{@chosen_word}'."
      end
    end
  end

  def self.game_over?
    if @slots.none? { |str| str == '_' }
      puts "Good job, you won!"
    end
  end
end