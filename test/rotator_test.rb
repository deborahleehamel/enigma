require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/rotator'
require 'pry'

class RotatorTest < Minitest::Test

  def test_message_can_be_accepted
    encrypt = Rotator.new("hi")
    #binding.pry
    assert_equal "hi", encrypt.message
  end

  def test_message_can_be_split_into_single_characters
    encrypt = Rotator.new("hi")
    assert_equal ["h","i"], encrypt.split_message
  end

  def test_cypher_can_be_passed_into_encryptor_class
    encrypt = Rotator.new("hi")
    assert_equal Cypher.new.character_map, encrypt.cypher
  end

  def test_converting_characters_to_nums_by_index
    encrypt = Rotator.new("hi")
    assert_equal [7,8], encrypt.indexed_message
  end

  def test_indexed_message_can_split_to_three_index_array
    encrypt =Rotator.new("hello")
    assert_equal [[7, 4, 11, 11], [14]], encrypt.parsed_message
  end

  def test_cycle_method_for_a_small_array_of_offsets
    encrypt = Rotator.new("hello world")
    assert_equal 12, encrypt.cycled_offsets.length
  end

  # def test_message_encrypts
  #   encrypt = Rotator.new("hello world")
  #   refute "hello world", encrypt.rotated
  # end

  # def test_new_array_contains_rotation_index_plus_cypher_index
  #   encrypt = Encryptor.new("hi")
  #   assert_equal , encrypt.rotation[0]
  # end
end
