require_relative 'serializer.rb'
require 'yaml'

class Game
  attr_accessor :board, :display
  include Serializer

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
      puts display.blue("Turn #{i}: Type in one letter and press 'Enter'. \nType 'Save' to save your current game or 'Exit' to quit at anytime.")
      @guess = gets.chomp.downcase
      if @guess == "save" # Added IF statement for saving game.
        save_game
        puts "Game Saved"
        redo
      elsif @guess == "load"
      # load method here
      elsif @guess == "exit"
        exit
      else # Part of saving game IF statement.
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
end # Added IF statement for saving game.

  def game_over?
    if board.full?
      puts display.green("Good job, you won!")
      puts " "
    end
  end

end
