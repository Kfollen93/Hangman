# frozen_string_literal: true
require 'yaml'

# Display board and update board
class Board
  attr_reader :word
  include Serializer

  def initialize(word)
    @word = word
    print @slots = Array.new(word.length) { '_' }
  end

  def update(guess)
    match = false
    @word.chars.each_with_index do |value, index|
      if value == guess
        @slots[index] = guess
        match = true
      end
    end
    match
    print @slots
    puts ''
  end

  def full?
    @slots.join('') == @word
  end
end
