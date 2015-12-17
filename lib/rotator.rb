require 'time'
require_relative 'cypher'
require_relative 'engine'
require 'pry'

class Rotator
  attr_reader :message, :cypher, :rotations, :engine
  def initialize(message = input_message, cypher = Cypher.new.character_map)
    @message = message
    @cypher = cypher
    @engine = Engine.new
    @rotations = engine.rotation
  end

  def input_message
    if ARGV[0] == nil
      File.read('message.txt')
    else
      File.read(ARGV[0])
    end
  end

  def split_message
    message.downcase.chars
  end

  def indexed_message
    split_message.map {|d| @cypher.index(d)}
  end

  def parsed_message
    comb_value = indexed_message
    indexed_message.each_slice(4).to_a {|a| p a}
  end

  def cycled_offsets
    offset = @rotations
    p_message = parsed_message
    complete_offset = offset.cycle(p_message.length).map {|x| x}
  end

  def creating_rotate_offset
    rotate_offset = parsed_message.flatten.zip(cycled_offsets).map {|x1, x2| x1.to_i + x2.to_i}
  end

  def output_message(encrypted_message)
    if ARGV[1] == nil
      File.write('encrypted.txt', encrypted_message)
    else
      File.write(ARGV[1], encrypted_message)
    end
  end

  def rotated
    sum_for_rotator = creating_rotate_offset
    encrypted_message = []
    sum_for_rotator.each do |e|
      encrypted_message << @cypher.rotate(e)[0]
    end
    encrypted_message = encrypted_message.join("")
    output_message(encrypted_message)
    encrypted_message
  end
  # binding.pry
end

if __FILE__ == $0
c = Rotator.new
c.rotated
puts "Created #{ARGV[1]} with the key #{c.engine.key.join} and date #{c.engine.date.strftime("%d%m%y")}"
end

# Rotator.new("Hello World",Cypher.new.character_map).rotated
# Rotator.new("fmotmfzwptg",Cypher.new.character_map.reverse).rotated
