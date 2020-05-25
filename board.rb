class Board

def initialize
    @slots = $chosen_word.chars
end

def input_guess
    puts " "
    1.upto(6) do |i|
        puts "Turn #{i}: Type in one letter and press 'Enter'."
        @guess = gets.chomp
        until @guess =~ /\A[a-z]{1}\z/ #Regex for guess as a String.
        puts 'Your guess must only be one lowercase alphabetic letter.'
        @guess = gets.chomp
        end
        check_for_correct_guess #calls method below to check after each guess
        if i >= 6
            puts "You lose. The word was: '#{$chosen_word}'."
        end
    end
end

def check_for_correct_guess
    #if correct guess
    @slots.each_with_index do |blank, index|
        if @slots.include?(@guess) && @slots[index] == '_'
            puts "yes" #then display the character on the slot that matches the index of array
            #puts @slots[index]
        end
    end
end

def check_for_wrong_guess
    #if letter not included in array of choose_word
    #then display on a new line as a separate array and add to it each time
end


def map_blanks 
    print @slots.map { |blanks| '_' }
    puts " "
end

end