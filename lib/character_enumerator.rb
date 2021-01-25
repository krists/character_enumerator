require "character_enumerator/version"

module CharacterEnumerator
  module Implementation
    VALID_CHARACTERS_REGEXP = /\A[A-Z]+\z/
    BLANK_STRING_REGEXP = /\A[[:space:]]*\z/

    def generate(size)
      Enumerator.new(size) do |y|
        size.times do |index|
          y << internal_integer_to_characters(index)
        end
      end
    end

    def integer_to_characters(value)
      raise ArgumentError, "Value must be integer" unless value.is_a?(Integer)
      raise ArgumentError, "Value must be non-negative integer" if value < 0
      internal_integer_to_characters(value)
    end

    def characters_to_integer(characters)
      raise ArgumentError, "argument must be string" unless characters.is_a?(String)
      is_blank =\
        if characters.respond_to?(:blank?)
          characters.blank?
        else
          characters.match?(BLANK_STRING_REGEXP)
        end
      return nil if is_blank
      raise ArgumentError, "argument must be string matching regexp: #{VALID_CHARACTERS_REGEXP.inspect}" unless characters.match?(VALID_CHARACTERS_REGEXP)
      result = 0
      characters.unpack("C*") do |number|
        result *= 26
        result += number - 64
      end
      result - 1
    end

    private

    def internal_integer_to_characters(value)
      result = []
      dividend = value + 1
      while dividend > 0
        modulo = (dividend - 1) % 26
        result.unshift(65 + modulo)
        dividend = (dividend - modulo) / 26
      end
      result.pack("C*")
    end
  end

  extend Implementation
end
