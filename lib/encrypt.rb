require_relative 'cypher'   # => true
require_relative 'engine'   # => true
require_relative 'rotator'  # => true
require 'pry'               # => false

class Encrypt
  def encrypt(message)
    c = Rotator.new(message,Cypher.new.character_map).rotated
    puts c
  end                                                          # => :encrypt
end                                                            # => :encrypt

#Encrypt.new("Hello World")  # ~> ArgumentError: wrong number of arguments (1 for 0)

# ~> ArgumentError
# ~> wrong number of arguments (1 for 0)
# ~>
# ~> /Users/deborahhamel/Turing/1module/my_project_folder/enigma/lib/encrypt.rb:14:in `initialize'
# ~> /Users/deborahhamel/Turing/1module/my_project_folder/enigma/lib/encrypt.rb:14:in `new'
# ~> /Users/deborahhamel/Turing/1module/my_project_folder/enigma/lib/encrypt.rb:14:in `<main>'
