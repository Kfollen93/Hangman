class Display
  def instructions
    puts <<~MYHEREDOC

      #{blue('        Classic Hangman, the rules are simple.

      Computer sets a word, you guess one letter per turn.
          You have 6 turns to guess the word correctly.')}

    MYHEREDOC
    puts " "
    sleep(1)
  end

  # Color Methods
  def colorize(text, color_code); "\e[#{color_code}m#{text}\e[0m"; end

  def red(text); colorize(text, 31); end

  def green(text); colorize(text, 32); end

  def blue(text); colorize(text, 36); end
end
