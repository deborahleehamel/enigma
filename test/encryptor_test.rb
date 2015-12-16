require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/encryptor'
require 'pry'



class EncryptorTest < Minitest::Test

  def test_message_can_be_accepted
    encrypt = Encryptor.new("hi")
    assert_equal "hi", encrypt.message
  end

  def test_message_can_be_split_into_single_characters
    encrypt = Encryptor.new("hi")
    assert_equal ["h","i"], encrypt.split_message
  end
  #
  def test_cypher_can_be_passed_into_encryptor_class
    encrypt = Encryptor.new("hi")
    assert_equal Cypher.new.character_map, encrypt.cypher
  end

  def test_converting_characters_to_nums_by_index
    encrypt = Encryptor.new("hi")
    assert_equal [7,8], encrypt.indexed_message
  end

  def test_indexed_message_can_split_to_three_index_array
    encrypt = Encryptor.new("hello")
    assert_equal [[7, 4, 11, 11], [14]], encrypt.parsed_message
  end

# def cycled_offsets. works, but test need to be revisited
  def test_cycle_method_for_a_small_array_of_offsets
    skip
    encrypt = Encryptor.new("hello world")
    assert_equal true, encrypt.cycled_offsets.length

  end

  def test_message_encrypts
    encrypt = Encryptor.new("hello world")
    refute "hello world", encrypt.encrypted
  end

  # def test_parsed_message_index_array_combined_with_crypt_array
  #   encrypt = Encryptor.new("hello")
  #   assert_equal [7, 4, 11, 11][14], encrypt.parsed_message
  # end

  # def test_new_array_contains_rotation_index_plus_cypher_index
  #   encrypt = Encryptor.new("hi")
  #   assert_equal , encrypt.rotation[0]
  # end
end
