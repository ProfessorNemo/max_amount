# frozen_string_literal: true

require_relative 'max_amount/version'

require 'optparse'
require 'securerandom'
require 'dotenv/load'
require_relative 'max_amount/options'
require_relative 'max_amount/cli'
require_relative 'max_amount/errors'
require_relative 'max_amount/extract_integer'

# Main MaxAmount module
module MaxAmount
end

# путь к файлу с пользовательской строкой
path = File.expand_path('./max_amount/data/user_data.txt', __dir__)

# если файла нет, то присваиваем nil
custom_string = File.exist?(path) ? File.read(path) : nil

MaxAmount::CLI.call(custom_string: custom_string)
