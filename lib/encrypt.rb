require_relative 'cypher'
require_relative 'engine'
require_relative 'rotator'
require 'pry'

class Encrypt
  def encrypt(message)
    c = Rotator.new(message,Cypher.new.character_map).rotated
    puts c
  end
end

#Encrypt.new("Hello World")
