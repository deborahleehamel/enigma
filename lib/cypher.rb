require "pry"

class Cypher
  attr_reader :character_map
  def initialize
    # initialize default start point but I can call as regular methos and use Cypher in other places, what you want
    letters = ("a".."z").to_a
    numbers = (0..9).to_a
    @character_map = letters + numbers + [" ", ".", ","]
  end
end

# map = CharacterMap.new
# puts map.character_map[20]
