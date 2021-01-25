require "test_helper"

class CharacterEnumeratorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CharacterEnumerator::VERSION
  end

  def test_integer_to_characters_with_valid_arguments
    assert_equal "A", CharacterEnumerator.integer_to_characters(0)
    assert_equal "B", CharacterEnumerator.integer_to_characters(1)
    assert_equal "Z", CharacterEnumerator.integer_to_characters(25)
    assert_equal "AA", CharacterEnumerator.integer_to_characters(26)
    assert_equal "AB", CharacterEnumerator.integer_to_characters(27)
    assert_equal "AZ", CharacterEnumerator.integer_to_characters(51)
    assert_equal "BA", CharacterEnumerator.integer_to_characters(52)
    assert_equal "KIVI", CharacterEnumerator.integer_to_characters(200_000)
  end

  def test_characters_to_integer_with_valid_arguments
    assert_equal 0, CharacterEnumerator.characters_to_integer("A")
    assert_equal 1, CharacterEnumerator.characters_to_integer("B")
    assert_equal 25, CharacterEnumerator.characters_to_integer("Z")
    assert_equal 26, CharacterEnumerator.characters_to_integer("AA")
    assert_equal 27, CharacterEnumerator.characters_to_integer("AB")
    assert_equal 51, CharacterEnumerator.characters_to_integer("AZ")
    assert_equal 52, CharacterEnumerator.characters_to_integer("BA")
    assert_equal 200000, CharacterEnumerator.characters_to_integer("KIVI")
  end

  def test_integer_to_characters_with_negative_values
    error = assert_raises(ArgumentError) do
      CharacterEnumerator.integer_to_characters(-1)
    end
    assert_equal "Value must be non-negative integer", error.message
  end

  def test_integer_to_characters_with_non_integer_values
    error = assert_raises(ArgumentError) do
      CharacterEnumerator.integer_to_characters(1.0)
    end
    assert_equal "Value must be integer", error.message
  end

  def test_characters_to_integer_with_empty_string
    assert_nil CharacterEnumerator.characters_to_integer("")
  end

  def test_characters_to_integer_with_non_string_values
    error = assert_raises(ArgumentError) do
      CharacterEnumerator.characters_to_integer(1.0)
    end
    assert_equal "argument must be string", error.message
  end

  def test_characters_to_integer_with_invalid_characters
    error = assert_raises(ArgumentError) do
      CharacterEnumerator.characters_to_integer("A123$")
    end
    assert_equal "argument must be string matching regexp: /\\A[A-Z]+\\z/", error.message
  end

  def test_generate_with_zero
    enumerator = CharacterEnumerator.generate(0)
    assert_equal 0, enumerator.size
    assert_equal [], enumerator.entries
  end

  def test_generate_with_entries
    enumerator = CharacterEnumerator.generate(30)
    assert_equal 30, enumerator.size
    expected_entries = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "AB", "AC", "AD"]
    assert_kind_of(Enumerator, enumerator)
    assert_equal expected_entries, enumerator.entries
  end
end
