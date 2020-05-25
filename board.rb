class Board

def initialize
    @slots = $chosen_word.chars
end

def input_guess
    puts " "
    @used_letters = []
    1.upto(6) do |i|
        puts "Turn #{i}: Type in one letter and press 'Enter'."
        @guess = gets.chomp
        #Regex for guess as a String. && Checks if guess includes a used letter, if it does, it will loop.
        #However, I'm not sure what will happen if it's a correct letter that's entered twice yet.
        until @guess =~ /\A[a-z]{1}\z/ && !@used_letters.include?(@guess) #until used letters do not (!) include guess
        puts 'Your guess must be one lowercase letter and not used before.'
        @guess = gets.chomp
        end
        check_for_correct_guess #calls method below to check after each guess
        check_for_wrong_guess #calls method below to check after each guess
        map_blanks #calls method
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
    unless @slots.include?(@guess) 
        @used_letters.push(@guess)
        puts "Used letter(s): #{@used_letters}"
        puts " "
    end
end


def map_blanks 
    print @slots.map { |blanks| '_' }
    puts " "
end

end