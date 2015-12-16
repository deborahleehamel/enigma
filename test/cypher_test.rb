require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/cypher'

class CypherTest < Minitest::Test
  def test_letter_output_based_on_array_index
    cypher = Cypher.new
    assert_equal "a", cypher.character_map[0]
    assert_equal "z", cypher.character_map[25]
  end

  def test_integer_output_based_on_array_index
    cypher = Cypher.new
    assert_equal 0, cypher.character_map[26]
    assert_equal 9, cypher.character_map[35]
  end
#test for reverse or rotate
  def test_cypher_based_on_array_index
    cypher = Cypher.new
    assert_equal ".", cypher.character_map[37]
    assert_equal ",", cypher.character_map[38]
  end

  def test_cypher_based_on_sequence
    cypher = Cypher.new
    assert_equal ["b", "c", "d", "e"], cypher.character_map.slice(1,4)
  end

  def test_map_length_is_38_cypher
    cypher = Cypher.new
    assert_equal 39, cypher.character_map.length
  end

  def test_character_output_by_random_index
    cypher = Cypher.new
    assert_equal ["c", "n", 0, " "], cypher.character_map.values_at(2,13,26,36)
  end


end
