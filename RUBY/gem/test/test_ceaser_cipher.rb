require "test/unit"
require 'ceaser_cipher'

class CeaserCipherTest < Test::Unit::TestCase
  def test_fixed_number
    assert_raise(TypeError){ ceaser_cipher('What a string', 'a') }
  end

#   def test_input_string_size_greater_than_zero
#     assert_match(E)
  def test_is_correct_result
    assert_equal('z', ceaser_cipher('a', -1))
    assert_equal('B', ceaser_cipher('Z', 2))
    assert_equal("Bmfy f xywnsl!", ceaser_cipher("What a string!", 5))
  end

  def test_incorrect_result
    assert_equal('{', ceaser_cipher('z', 1), "wrong encrypted!")
    assert_equal('@', ceaser_cipher('A', -1), "wrong encrypted!")
  end
end