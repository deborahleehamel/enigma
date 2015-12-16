require_relative 'cypher'  # => true
require_relative 'engine'  # => true
require 'pry'              # => false

class Encryptor
  attr_reader :message, :cypher         # => nil
  def initialize(message = nil)
    @message = message                  # => "Hello World"
    @cypher = Cypher.new.character_map  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", ".", ","]
    @rotations = Engine.new.rotation    # => [57, 12, 4, 28]
  end                                   # => :initialize

  def split_message
    message.downcase.chars  # => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
  end                       # => :split_message

  def indexed_message
    split_message.map {|d| @cypher.index(d)}  # => [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3]
  end                                         # => :indexed_message

  def parsed_message
    comb_value = indexed_message                  # => [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3]
    indexed_message.each_slice(4).to_a {|a| p a}  # => [[7, 4, 11, 11], [14, 36, 22, 14], [17, 11, 3]], [[7, 4, 11, 11], [14, 36, 22, 14], [17, 11, 3]]
  end                                             # => :parsed_message

  def cycled_offsets
    # puts "this is the sum or the thing you add to your indexed"
    offset = @rotations #print if want to see
    p_message = parsed_message                                    # => [[7, 4, 11, 11], [14, 36, 22, 14], [17, 11, 3]]
    complete_offset = offset.cycle(p_message.length).map {|x| x}  # => [57, 12, 4, 28, 57, 12, 4, 28, 57, 12, 4, 28]
  end                                                             # => :cycled_offsets

  def creating_rotate_offset
    # flattened_message = parsed_message.flatten
    # puts "this is the rotate_offset"
    # flat_offsets = cycled_offsets
    # puts "what is going on???"
    rotate_offset = parsed_message.flatten.zip(cycled_offsets).map {|x1, x2| x1.to_i + x2.to_i}  # => [64, 16, 15, 39, 71, 48, 26, 42, 74, 23, 7]
    # return rotate_offset #puts if want to see
  end                                                                                            # => :creating_rotate_offset

  def encrypted
    sum_for_rotator = creating_rotate_offset  # => [64, 16, 15, 39, 71, 48, 26, 42, 74, 23, 7]
    golden_eggs = []                          # => []
    sum_for_rotator.each do |e|               # => [64, 16, 15, 39, 71, 48, 26, 42, 74, 23, 7]
      golden_eggs << @cypher.rotate(e)[0]     # => ["z"], ["z", "q"], ["z", "q", "p"], ["z", "q", "p", "a"], ["z", "q", "p", "a", 6], ["z", "q", "p", "a", 6, "j"], ["z", "q", "p", "a", 6, "j", 0], ["z", "q", "p", "a", 6, "j", 0, "d"], ["z", "q", "p", "a", 6, "j", 0, "d", 9], ["z", "q", "p", "a", 6, "j", 0, "d", 9, "x"], ["z", "q", "p", "a", 6, "j", 0, "d", 9, "x", "h"]
    end                                       # => [64, 16, 15, 39, 71, 48, 26, 42, 74, 23, 7]
    golden_eggs.join("")                      # => "zqpa6j0d9xh"
  end                                         # => :encrypted
  # binding.pry
end                                           # => :encrypted
Encryptor.new("Hello World").encrypted        # => "zqpa6j0d9xh"
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
