require_relative 'cypher'
require_relative 'engine'
require 'pry'

class Crack
  attr_reader :encrypted_messaage

  def initialize (encrypted_messaage)
    @message = encrypted_message
    @cypher = Cypher.new.character_map
    @rev_cypher = Cypher.new.character_map.reverse
  end

  def split_message
    split_pea = @message.downcase.chars
    return split_pea
  end

def indexed_message
  index_pea = split_message
  numbered = index_pea.map { |i|  @rev_cypher.index(i)}
  return numbered
end

def chopped_message
  chopped = indexed_message.length
  chopped % 4 [0..-2]

end

def method
  mssg[-7..-1] zip(..end..)

  if mssg % 4 == 0 #no reaminder from mssg % 4
    let [-4..-1]#
  else
    7 - remainder(3?) - 4 = [-7..-4]
    7 - remainder(2?) - 5 =
    7 - remainder(1?) - 6 =

    slice(4)
    remove any[...nil]
  end

*index encryption going backwards

*index of each character from the original message going backwards

*difference between index of encrypted msg going backwards and index of each character from original message (if negative add 39)

*length of encryption % 4

*remainder tells you where a, b, c, d are

*forward index plus rotation

end
