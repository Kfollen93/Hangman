class Display # this might need to change to a module and rename

def instructions
 puts   <<~MYHEREDOC

        Classic Hangman, the rules are simple.

    Computer sets a word, you guess one letter per turn.
        You have 6 turns to guess the world correctly.

    MYHEREDOC

    "Crunching algorithms and setting word...\n"#.each_char { |c| putc c ; sleep 0.10 }
    puts " "
end

end