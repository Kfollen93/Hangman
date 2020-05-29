# frozen_string_literal: true

require_relative 'serializer.rb'
require 'yaml'

# Sets up the game and runs it in its entirety.
class Game
  attr_accessor :board, :display
  include Serializer

  def setup
    p word = choose_word # reminder, this is the method "choose_word"
    @word = word # Access to lose statement.
    puts "Type 'Load' to load a game, or press any key to start new."
    input = gets.chomp.downcase
    input == 'load' ? load_game : @board = Board.new(word) # if T no board made
    @used_letters = []
    @display = Display.new # Access to color methods
  end

  def dictionary
    File.readlines('5desk.txt', chomp: true) # chomp removes the \n.
  end

  def choose_word
    word = dictionary.select { |words| words.length.between?(5, 12) }.sample
    chosen_word = word.downcase
    chosen_word
  end

  def start
    puts ''
    1.upto(6) do |i|
      break if board.full? == true

      puts display.blue("Turn #{i}: Type in one letter and press 'Enter'. \n
      Type 'Save' to save your current game or 'Exit' to quit at anytime.")
      @guess = gets.chomp.downcase
      save_or_exit
      @guess == 'save' ? redo :
        until @guess =~ /\A[a-z]{1}\z/ && !@used_letters.include?(@guess)
          puts 'Your guess must be one lowercase letter and not used before.'
          @guess = gets.chomp
        end
      puts ''
      board.update(@guess)
      puts ''
      print display.red("Used letters: #{@used_letters.push(@guess)}\n")
      game_over?
      if @word.include?(@guess)
        redo # Start again at the same turn.
      end
      if i >= 6
        puts display.red("You lose. The word was: #{@word}.\n")
      end
    end
  end
end

def game_over?
  return unless board.full?

  puts display.green("Good job, you won!\n")
end

def save_or_exit
  if @guess == 'save'
    save_game
    puts 'Game Saved'
  elsif @guess == 'exit'
    exit
  end
end
