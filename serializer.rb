# frozen_string_literal: true

# Module for saving YAML data
module Serializer
  def save_game
    Dir.mkdir 'saves' unless Dir.exist? 'saves'
    filename = 'save_game.yaml'
    File.open("saves/#{filename}", 'w') { |file| file.write save_to_yaml }
  end

  def save_to_yaml
    YAML.dump({
                [] => @used_letters,
                #'word' => @word,
                #Array.new(@word.length) { '_' } => @slots,
                Board.new(@word) => @board
              })
  end

  def load_game
    file = YAML.load(File.read('saves/save_game.yaml'))
    @board = file[Board.new(@word)]
    #@word = file['word']
    @used_letters = file[[]]
    #@slots = file[Array.new(@word.length) { '_' }]
  end
end
