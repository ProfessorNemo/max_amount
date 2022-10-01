# frozen_string_literal: true

module MaxAmount
  class Seeker
    # максимальный размер целого числа
    MAX_SIZE_DIGITAL = 1_000

    attr_accessor :input_data, :count_numbers

    def initialize(params = {})
      @input_data = params[:text]

      @count_numbers = params[:nmax]
    end

    def check_errors
      raise InputDataCountNumbersMustExist if @input_data.nil? || @count_numbers.nil?

      raise InputDataEmpty if @input_data.empty?

      raise CountNumbersMustBePositive if @count_numbers.negative?

      raise CountNumbersNotEqualZero if @count_numbers.zero?

      self
    end

    def search
      # берем из строки только целые неотрицательные числа
      numbers = input_data.scan(/\d+/).select do |num|
        num.to_i.is_a?(Integer) && num.to_i.positive?
      end.map(&:to_i).uniq

      # длина каждого числа не может превышать заданную величину "MAX_SIZE_DIGITAL"
      numbers.each { |num| raise InvalidDigitInput if number_length(num.to_i) > MAX_SIZE_DIGITAL }

      # числа должны быть
      raise NotContainZero if numbers.size.zero?

      numbers.sort!.reverse!

      # вывод наибольших целых чисел в количестве "count_numbers" штук
      numbers[0..count_numbers - 1]
    end

    def number_length(digit)
      # Math.log10(digit).to_i + 1
      # или
      digit.to_s.chars.map(&:to_i).count
    end
  end
end
