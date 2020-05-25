class Board

def game_board
end

def input_guess
    guess = gets.chomp
    until guess =~ /\A[a-z]{1}\z/ #Regex for guess as a String.
    puts 'Your guess must only be one alphabetic character.'
    guess = gets.chomp
    end
end

end