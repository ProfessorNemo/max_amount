# frozen_string_literal: true

require_relative 'main'

# Main MaxAmount module
module MaxAmount
  def self.result(custom_string = nil)
    MaxAmount::CLI.call(custom_string: custom_string)
  end
end

# путь к файлу с пользовательской строкой
# path = File.expand_path('./max_amount/data/user_data.txt', __dir__)

# если файла нет, то присваиваем nil
# custom_string = File.exist?(path) ? File.read(path) : nil
