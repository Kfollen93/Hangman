class Board

def initialize
    #@slots = $choose_word  # _ _ _ appears for each char in choose_word variable
    @slots = Array.new(12, nil)
end

def input_guess
    1.upto(6) do |i|
        puts "Turn #{i}: Type in one letter and press 'Enter'."
        guess = gets.chomp
        until guess =~ /\A[a-z]{1}\z/ #Regex for guess as a String.
        puts 'Your guess must only be one alphabetic letter.'
        guess = gets.chomp
        end
    end
end

def correct_guess
    #if correct guess
    #then display the character on the slot that matches the index of array
end

def wrong_guess
    #if letter not included in array of choose_word
    #then display on a new line as a separate array and add to it each time
end
def to_s
    @slots.map do |slots|
        print slots || '_ '
    end
    puts " "
    puts " "
end

end