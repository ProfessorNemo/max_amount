# frozen_string_literal: true

require_relative 'main'

# Main MaxAmount module
module MaxAmount
  def self.result(custom_string = nil)
    MaxAmount::Cli.call(custom_string: custom_string)
  end
end