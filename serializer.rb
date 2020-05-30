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
                "board" => @board
              })
  end

  def load_game
    file = YAML.load(File.read('saves/save_game.yaml'))
    @word = file["board"].word
    @used_letters = file[[]]
    @board = file["board"]
  end
end
