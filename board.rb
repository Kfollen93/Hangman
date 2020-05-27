class Board
    def initialize(word)
      @slots = word.chars
    end
  
    def map_blanks
      print @slots.map { '_' }
      puts ' '
    end
end

def update
  @slots.each_with_index do |value, index|
    if @guess.include?(@slots[index])
      print @slots[index] = value
    elsif !@slots.include?(@guess)
      @used_letters.push(@guess)
      puts "Used letter(s): #{@used_letters}"
      puts " "
    end
end