require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/decryptor'
require 'pry'

class DecryptTest < Minitest::Test

  def test_message_can_be_accepted
    decrypt = Decrypt.new("hi")
    assert_equal "hi", decrypt.message
  end

  def test_message_can_be_split_into_single_characters
    decrypt = Decrypt.new("hi")
    assert_equal ["h","i"], decrypt.split_message
  end
  #
  def test_cypher_can_be_passed_into_decryptor_class
    decrypt = Decrypt.new("hi")
    assert_equal Cypher.new.character_map, decrypt.cypher
  end

  def test_converting_characters_to_nums_by_index
    decrypt = Decrypt.new("hi")
    assert_equal [7,8], decrypt.indexed_message
  end

  def test_indexed_message_can_split_to_three_index_array
    decrypt = Decrypt.new("hello")
    assert_equal [[7, 4, 11, 11], [14]], decrypt.parsed_message
  end

# def cycled_offsets. works, but test need to be revisited
  def test_cycle_method_for_a_small_array_of_offsets
    skip
    decrypt = Decrypt.new("hello world")
    assert_equal true, decrypt.cycled_offsets.length

  end

  def test_message_decrypts
    decrypt = Decrypt.new("vss32hp0o0")
    refute "hello world", decrypt.decrypted
  end

  # def test_parsed_message_index_array_combined_with_crypt_array
  #   decrypt = Decrypt.new("hello")
  #   assert_equal [7, 4, 11, 11][14], decrypt.parsed_message
  # end

  # def test_new_array_contains_rotation_index_plus_cypher_index
  #   decrypt = Decrypt.new("hi")
  #   assert_equal , decrypt.rotation[0]
  # end
end
