require "character_enumerator/version"

module CharacterEnumerator
  module Implementation
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
