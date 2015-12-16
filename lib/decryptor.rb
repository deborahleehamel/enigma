require_relative 'cypher'  # => true
require_relative 'engine'  # => true
require 'pry'              # => false

class Decryptor
  attr_reader :message, :cypher                               # => nil
  def initialize(message = nil, rotations = [57, 12, 4, 28])
    @message = message                                        # => "zqpa6j0d9xh"
    @cypher = Cypher.new.character_map.reverse                # => [",", ".", " ", 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    @rotations = rotations                                    # => [57, 12, 4, 28]
  end                                                         # => :initialize

  def split_message
    message.downcase.chars  # => ["z", "q", "p", "a", "6", "j", "0", "d", "9", "x", "h"], ["z", "q", "p", "a", "6", "j", "0", "d", "9", "x", "h"], ["z", "q", "p", "a", "6", "j", "0", "d", "9", "x", "h"], ["z", "q", "p", "a", "6", "j", "0", "d", "9", "x", "h"]
  end                       # => :split_message

  def indexed_message
    split_message.map {|d| @cypher.index(d)}  # => [13, 22, 23, 38, nil, 29, nil, 35, nil, 15, 31], [13, 22, 23, 38, nil, 29, nil, 35, nil, 15, 31], [13, 22, 23, 38, nil, 29, nil, 35, nil, 15, 31], [13, 22, 23, 38, nil, 29, nil, 35, nil, 15, 31]
  end                                         # => :indexed_message

  def parsed_message
    comb_value = indexed_message                  # => [13, 22, 23, 38, nil, 29, nil, 35, nil, 15, 31], [13, 22, 23, 38, nil, 29, nil, 35, nil, 15, 31]
    indexed_message.each_slice(4).to_a {|a| p a}  # => [[13, 22, 23, 38], [nil, 29, nil, 35], [nil, 15, 31]], [[13, 22, 23, 38], [nil, 29, nil, 35], [nil, 15, 31]]
  end                                             # => :parsed_message

  def cycled_offsets
    # puts "this is the sum or the thing you add to your indexed"
    offset = @rotations #print if want to see
    p_message = parsed_message                                    # => [[13, 22, 23, 38], [nil, 29, nil, 35], [nil, 15, 31]]
    complete_offset = offset.cycle(p_message.length).map {|x| x}  # => [57, 12, 4, 28, 57, 12, 4, 28, 57, 12, 4, 28]
  end                                                             # => :cycled_offsets

  def creating_rotate_offset
    # flattened_message = parsed_message.flatten
    # puts "this is the rotate_offset"
    # flat_offsets = cycled_offsets
    # puts "what is going on???"
    rotate_offset = parsed_message.flatten.zip(cycled_offsets).map {|x1, x2| x1.to_i + x2.to_i}  # => [70, 34, 27, 66, 57, 41, 4, 63, 57, 27, 35]
    # return rotate_offset #puts if want to see
  end                                                                                            # => :creating_rotate_offset

  def decrypted
    sum_for_rotator = creating_rotate_offset  # => [70, 34, 27, 66, 57, 41, 4, 63, 57, 27, 35]
    golden_eggs = []                          # => []
    sum_for_rotator.each do |e|               # => [70, 34, 27, 66, 57, 41, 4, 63, 57, 27, 35]
      golden_eggs << @cypher.rotate(e)[0]     # => ["h"], ["h", "e"], ["h", "e", "l"], ["h", "e", "l", "l"], ["h", "e", "l", "l", "u"], ["h", "e", "l", "l", "u", " "], ["h", "e", "l", "l", "u", " ", 8], ["h", "e", "l", "l", "u", " ", 8, "o"], ["h", "e", "l", "l", "u", " ", 8, "o", "u"], ["h", "e", "l", "l", "u", " ", 8, "o", "u", "l"], ["h", "e", "l", "l", "u", " ", 8, "o", "u", "l", "d"]
    end                                       # => [70, 34, 27, 66, 57, 41, 4, 63, 57, 27, 35]
    golden_eggs.join("")                      # => "hellu 8ould"
  end                                         # => :decrypted
  # binding.pry
end                                           # => :decrypted
Decryptor.new("zqpa6j0d9xh").decrypted        # => "hellu 8ould"
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
