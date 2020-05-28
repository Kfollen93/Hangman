require 'yaml'
class Game
  attr_accessor :board, :display

  def setup
    p word = choose_word # reminder, this is the method "choose_word"
    @word = word # Access to lose statement.
    @board = Board.new(word)
    @used_letters = []
    @display = Display.new # Access to color methods
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
    1.upto(6) do |i|
      break if board.full? == true
      puts display.blue("Turn #{i}: Type in one letter and press 'Enter' or\n type 'Save' to save your current game")
      @guess = gets.chomp
      until @guess =~ /\A[a-z]{1}\z/ && !@used_letters.include?(@guess)
        puts 'Your guess must be one lowercase letter and not used before.'
        @guess = gets.chomp
      end
      puts " "
      board.update(@guess)
      puts " "
      puts " "
      print display.red("Used letters: #{@used_letters.push(@guess)}\n")
      puts " "
      game_over?
      if @word.include?(@guess)
        redo # Makes the loop start again at the same turn.
      end
      if i >= 6
        puts display.red("You lose. The word was: #{@word}.")
        puts " "
      end
    end
  end

  def game_over?
    if board.full?
      puts display.green("Good job, you won!")
      puts " "
    end
  end
end

game = Game.new
output = File.new('save_games.yml', 'w')
output.puts YAML.dump(game)
output.close
