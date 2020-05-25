class Display

def instructions
 puts   <<~MYHEREDOC

        Classic Hangman, the rules are simple.

    Computer sets a word, you guess one character per turn.
        You have 6 turns to guess the world correctly.

    MYHEREDOC

    "Crunching algorithms and setting word...\n".each_char { |c| putc c ; sleep 0. }
    puts " "
end

def remaining_guesses
end

def correct_letters
end

def incorrect_letters
end

end