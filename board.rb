class Board
    def initialize(word)
      @slots = word.chars
    end
  
    def check_for_correct_guess
      @slots.each_with_index do |value, index|
        if @slots.include?(@guess[index]) #guess is just a letter, no index to reference
          print @slots[index] = value
        end
      end
    end
  
    def check_for_wrong_guess
      unless @slots.include?(@guess)
        @used_letters.push(@guess)
        puts "Used letter(s): #{@used_letters}"
        puts " "
      end
    end
  
    def map_blanks
      print @slots.map { '_' }
      puts ' '
    end
end


def update #need to refactor the two guess methods into one update method
end