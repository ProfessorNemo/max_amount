# frozen_string_literal: true

module Helpers
  def generate_sample_data(options = {})
    SampleDataGenerator.new(options).call
  end

  def number_length(digit)
    # Math.log10(digit).to_i + 1
    # или
    digit.to_s.chars.map(&:to_i).count
  end

  def check(*args)
    args[0].new(args[1]).check_errors.search
  rescue MaxAmount::Error => e
    e.message.to_s
  end
end
