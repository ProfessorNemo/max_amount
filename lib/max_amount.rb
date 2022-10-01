# frozen_string_literal: true

require_relative 'main'

# Main MaxAmount module
module MaxAmount
  def self.result(user_string = nil)
    MaxAmount::Cli.call(user_string: user_string)
  end
end