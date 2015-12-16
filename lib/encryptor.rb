require 'time'             # => true
require_relative 'cypher'  # => true
require_relative 'engine'  # => true
require 'pry'              # => false

class Encryptor
  attr_reader :message, :cypher                                                  # => nil
  def initialize(message, cypher)
    @message = message                                                           # => "Hello World", "fmotmfzwptg"
    @cypher = cypher                                                             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", ".", ","], [",", ".", " ", 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    @rotations = Engine.new(Time.parse('2015-06-04'), [6, 8, 4, 0, 3]).rotation  # => [76, 86, 42, 8], [76, 86, 42, 8]
  end                                                                            # => :initialize

  def split_message
    message.downcase.chars  # => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], ["f", "m", "o", "t", "m", "f", "z", "w", "p", "t", "g"], ["f", "m", "o", "t", "m", "f", "z", "w", "p", "t", "g"], ["f", "m", "o", "t", "m", "f", "z", "w", "p", "t", "g"], ["f", "m", "o", "t", "m", "f", "z", "w", "p", "t", "g"]
  end                       # => :split_message

  def indexed_message
    split_message.map {|d| @cypher.index(d)}  # => [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [33, 26, 24, 19, 26, 33, 13, 16, 23, 19, 32], [33, 26, 24, 19, 26, 33, 13, 16, 23, 19, 32], [33, 26, 24, 19, 26, 33, 13, 16, 23, 19, 32], [33, 26, 24, 19, 26, 33, 13, 16, 23, 19, 32]
  end                                         # => :indexed_message

  def parsed_message
    comb_value = indexed_message                  # => [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3], [33, 26, 24, 19, 26, 33, 13, 16, 23, 19, 32], [33, 26, 24, 19, 26, 33, 13, 16, 23, 19, 32]
    indexed_message.each_slice(4).to_a {|a| p a}  # => [[7, 4, 11, 11], [14, 36, 22, 14], [17, 11, 3]], [[7, 4, 11, 11], [14, 36, 22, 14], [17, 11, 3]], [[33, 26, 24, 19], [26, 33, 13, 16], [23, 19, 32]], [[33, 26, 24, 19], [26, 33, 13, 16], [23, 19, 32]]
  end                                             # => :parsed_message

  def cycled_offsets
    # puts "this is the sum or the thing you add to your indexed"
    offset = @rotations #print if want to see
    p_message = parsed_message                                    # => [[7, 4, 11, 11], [14, 36, 22, 14], [17, 11, 3]], [[33, 26, 24, 19], [26, 33, 13, 16], [23, 19, 32]]
    complete_offset = offset.cycle(p_message.length).map {|x| x}  # => [76, 86, 42, 8, 76, 86, 42, 8, 76, 86, 42, 8], [76, 86, 42, 8, 76, 86, 42, 8, 76, 86, 42, 8]
  end                                                             # => :cycled_offsets

  def creating_rotate_offset
    # flattened_message = parsed_message.flatten
    # puts "this is the rotate_offset"
    # flat_offsets = cycled_offsets
    # puts "what is going on???"
    rotate_offset = parsed_message.flatten.zip(cycled_offsets).map {|x1, x2| x1.to_i + x2.to_i}  # => [83, 90, 53, 19, 90, 122, 64, 22, 93, 97, 45], [109, 112, 66, 27, 102, 119, 55, 24, 99, 105, 74]
    # return rotate_offset #puts if want to see
  end                                                                                            # => :creating_rotate_offset

  def encrypted
    sum_for_rotator = creating_rotate_offset                             # => [83, 90, 53, 19, 90, 122, 64, 22, 93, 97, 45], [109, 112, 66, 27, 102, 119, 55, 24, 99, 105, 74]
    golden_eggs = []                                                     # => [], []
    sum_for_rotator.each do |e|                                          # => [83, 90, 53, 19, 90, 122, 64, 22, 93, 97, 45], [109, 112, 66, 27, 102, 119, 55, 24, 99, 105, 74]
      golden_eggs << @cypher.rotate(e)[0]                                # => ["f"], ["f", "m"], ["f", "m", "o"], ["f", "m", "o", "t"], ["f", "m", "o", "t", "m"], ["f", "m", "o", "t", "m", "f"], ["f", "m", "o", "t", "m", "f", "z"], ["f", "m", "o", "t", "m", "f", "z", "w"], ["f", "m", "o", "t", "m", "f", "z", "w", "p"], ["f", "m", "o", "t", "m", "f", "z", "w", "p", "t"], ["f", "m", "o", "t", "m", "f", "z", "w", "p", "t", "g"], ["h"], ["h", "e"], ["h", "e", "l"], ["h", "e", "l", "l"], ["h", "e", "l", "l", "o"], ["h", "e", "l", "l", "o", " "], ["h", "e", "l", "l", "o", " ", "w"], ["h", "e", "l", "l", "o", " ", "w", "o"], ["h", "e", "l", "l", "o", " ", "w", "o", "r"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l"], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    end                                                                  # => [83, 90, 53, 19, 90, 122, 64, 22, 93, 97, 45], [109, 112, 66, 27, 102, 119, 55, 24, 99, 105, 74]
    golden_eggs.join("")                                                 # => "fmotmfzwptg", "hello world"
  end                                                                    # => :encrypted
  # binding.pry
end                                                                      # => :encrypted
Encryptor.new("Hello World",Cypher.new.character_map).encrypted          # => "fmotmfzwptg"
Encryptor.new("fmotmfzwptg",Cypher.new.character_map.reverse).encrypted  # => "hello world"
