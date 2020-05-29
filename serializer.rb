module Serializer
    def save_game
        Dir.mkdir 'saves' unless Dir.exist? 'saves'
        @filename = "save_game.yaml"
        File.open("saves/#{@filename}", 'w') { |file| file.write save_to_yaml }
    end

    def save_to_yaml
        YAML.dump({
                    [] => @used_letters,
                    'word' => @word }
        )
      end

    def load_game
    end
end
