require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test

  def test_message_can_be_accepted
    decrypt = Decrypt.new("hi")
    assert_equal "hi", decrypt.message
  end

end
