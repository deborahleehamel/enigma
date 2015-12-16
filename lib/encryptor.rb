require_relative 'cypher'
require_relative 'engine'
require 'pry'

class Encryptor
  attr_reader :message, :cypher
  def initialize(message = nil)
    @message = message
    @cypher = Cypher.new.character_map
    @rotations = Engine.new.rotation
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
    # puts "this is the sum or the thing you add to your indexed"
    offset = @rotations #print if want to see
    p_message = parsed_message
    complete_offset = offset.cycle(p_message.length).map {|x| x}
  end

  def creating_rotate_offset
    # flattened_message = parsed_message.flatten
    # puts "this is the rotate_offset"
    # flat_offsets = cycled_offsets
    # puts "what is going on???"
    rotate_offset = parsed_message.flatten.zip(cycled_offsets).map {|x1, x2| x1.to_i + x2.to_i}
    # return rotate_offset #puts if want to see
  end

  def encrypted
    sum_for_rotator = creating_rotate_offset
    golden_eggs = []
    sum_for_rotator.each do |e|
      golden_eggs << @cypher.rotate(e)[0]
    end
    golden_eggs.join("")
  end
  # binding.pry
end
Encryptor.new("Hello World").encrypted
  # def decrypted
  #   reverse_cypher = @cypher.reverse
  #   sum_for_rotator = creating_rotate_offset
  #   the_golden_eggs = []
  #   sum_for_rotator.each do |e|
  #     the_golden_eggs << reverse_cypher.rotate(e)[0]
  #   end
  #   the_golden_eggs.join("")
  # end                                                 # => :decrypted


  # a1, a2 = flattened_message.to_i.each.next, flat_offsets.to_i.each.next
  # rotate_offset << a1 + a2
  # end
  # binding.pry
  # return rotate_offset
  # comb_array = flattened_message.zip(flat_offsets)
  # loop do
  #   rotate_offset << flattened_message + flat_offsets
  #   if


    # a = a1[0].to_i + a1[1].to_i
    # b = b1[0].to_i + b1[1].to_i
    # c = c1[0].to_i + c1[1].to_i
    # d = d1[0].to_i + d1[1].to_i
    # return rotate_offset = [a,b,c,d]

# encrypt = Encryptor.new("This is the...end...")
# # # puts encrypt.indexed_message
# # # encrypt.cycled_offsets
# # encrypt.creating_rotate_offset
# encrypt.encrypted
