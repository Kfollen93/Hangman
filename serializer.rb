require 'yaml'
class Serializer
    def serialize(x)
        Pathname('save_games.yml').exist? append_data(x) : new_file_create(x)
    end

    def deserialize
    end
end
