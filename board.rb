class Board
  attr_reader :word

  def initialize(word)
    @word = word
    @slots = Array.new(word.length) { "_" }
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
  end

  def full?
    @slots.join("") == @word
  end
end
