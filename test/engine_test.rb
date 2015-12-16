require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/engine'
require 'pry'



class EngineTest < Minitest::Test

  def setup
    engine = Engine.new
    @key = [1,2,3,4,5]
    @date = "2015-12-15 22:10:13 -0700"
  end
  # def test_random_five_number_output
  #   results = []
  #   100.times do
  #   input = KeyGenerator.new
  #   results << input
  # end
  # assert results.uniq.count > 50
  # end

  def test_that_it_initializes
    assert_equal [1,2,3,4,5], @key
    assert_equal "2015-12-15 22:10:13 -0700", @date
  end

  def test_key_gen_array_length
    engine = Engine.new
    assert_equal 4, engine.key_gen.length
  end

  def test_final_rotation
    skip
    engine = Engine.new
    assert_equal [2], engine.rotation
  end

  # def test_key_gen_array_length
  #   engine = Engine.new
  #   # index_length = engine.key_gen[0]
  #
  #   assert_equal 2, engine.key_gen[0].size
  # end

  def test_date_of_today
    skip
    engine = Engine.new

    assert engine.date
  end

  # def test_date_offeset_returns_last_four_of_squared_date
  #   skip #revisit for always true assert_equal
  #   engine = Engine.new
  #   engine.date_offset
  #   assert_equal "6225", engine.date_offset
  # end

  def test_date_a_variable_matches_index
    skip
    engine = Engine.new
    assert_equal [6, 2, 2, 5], engine.date_assignment
  end

  def test_key_gen_index_matches_assigned_letter
    skip

    engine = Engine.new
    assert_equal ["6","2","2","5"], engine.date_assignment
  end

#rework this test
  # def test_rotation_returns_sum_of_key_gen_and_date_offsets
  #   skip
  #     e = Engine.new
  #     binding.pry
  #     # key_plus_offset = e.key_gen[0].to_i + e.date_assignment[0].to_i
  #     # a_rotation = e.rotation[0]
  #     assert_equal true, e.rotation[0] == e.key_gen[0].to_i + e.date_assignment[0].to_i
  #     binding.pry
  # end



end
