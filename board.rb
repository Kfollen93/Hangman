# frozen_string_literal: true

# Display board and update board
class Board
  attr_reader :word

  def initialize(word)
    @word = word
    @slots = Array.new(word.length) { '_' }
  end

  def update(guess)
    @word.chars.each_with_index do |value, index|
      if value == guess
        @slots[index] = guess
      end
    end
    print @slots
    puts ''
  end

  def full?
    @slots.join('') == @word
  end
end
