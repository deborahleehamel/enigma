require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < Minitest::Test

  def test_crack_can_initialize
    crack = Crack.new
    assert_equal ,
  end

end
