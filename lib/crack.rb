require_relative 'cypher'
require_relative 'engine'
require_relative 'decrypt'


class Crack
	attr_reader :input, :expected

	def initialize(input)
		@input = File.read(input_message)
		@expected = [13, 3, 37, 37]
	end

	def input_message
     if ARGV[0] == nil
       File.read("message.txt")
     else
       File.read(ARGV[0])
     end
   end

	def characters
    character_map = ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]
  end

	def length
		@input.length
	end

	def key_text
		text = []
		text = @input[-4..-1].chars
	end

	def position_array
		key = []
		key << (length - 4) % 4
		key << (length - 3) % 4
		key << (length - 2) % 4
		key << (length - 1) % 4
	end

	def encrypted_character_value
  	answer = []
  	key_text.each do |x|
  		answer << characters.index(x).to_i
  	end
		answer
  end

  def find_key
		offset_true = []
   	offset_true << (39 - @expected[0]) + encrypted_character_value[0]
   	offset_true << (39 - @expected[1]) + encrypted_character_value[1]
   	offset_true << (39 - @expected[2]) + encrypted_character_value[2]
   	offset_true << (39 - @expected[3]) + encrypted_character_value[3]
  end

  def put_in_order
		order = Hash[position_array.zip(find_key)]
    order.map.with_index do |x, index|
      order[index]
		end
  end

  def decrypt(argument)
    Decrypt.new(put_in_order).decrypt(argument)
  end

	def output_cracked_code(cracked_message)
    if ARGV[1] == nil
      File.write("cracked.txt", cracked_message)
    else
      File.write(ARGV[1], cracked_message)
    end
  end
end
# ruby ./lib/crack.rb encrypted.txt cracked.txt
if __FILE__ == $PROGRAM_NAME
e = Crack.new
e.encrypt
e.crack
  if ARGV[1] == nil
    puts "Created 'cracked.txt' from 'encrypted.txt' with the cracked key #{e.cracked_key} and date #{e.date}"
  else
    puts "Created #{ARGV[1]} from #{ARGV[0]} with the cracked key #{e.cracked_key} and date #{e.date}"
  end
end
