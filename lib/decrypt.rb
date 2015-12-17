require_relative 'cypher'
require_relative 'engine'
require_relative 'rotator'
require 'pry'


class Decrypt
  def decrypt(message)
    c = Rotator.new(message,Cypher.new.character_map.reverse).rotated
    puts c
  end
end

# Decrypt.new.decrypt("6n9n7np1w9qdy0vds")
