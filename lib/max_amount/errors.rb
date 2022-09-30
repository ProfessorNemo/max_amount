# frozen_string_literal: true

module MaxAmount
  class Error < StandardError
  end

  class InputDataEmpty < Error
    def message
      'The string cannot be empty'
    end
  end

  class CountNumbersMustBePositive < Error
    def message
      'The entered number must be positive'
    end
  end

  class CountNumbersNotEqualZero < Error
    def message
      'The entered number cannot equal to zero'
    end
  end

  class InputDataCountNumbersMustExist < Error
    def message
      'The string and number must exist'
    end
  end

  class NotContainZero < Error
    def message
      'Must have at least one number'
    end
  end

  class InvalidDigitInput < Error
    def message
      'The length of the number cannot exceed the specified value'
    end
  end
end
