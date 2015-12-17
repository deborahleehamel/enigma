require "pry"

class Cypher
  attr_reader :character_map
  def initialize
    # initialize default start point but I can call as regular methods and use Cypher in other places
    letters = ("a".."z").to_a
    numbers = (0..9).to_a
    @character_map = letters + numbers + [" ", ".", ","]
  end
end
