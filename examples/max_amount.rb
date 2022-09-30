# frozen_string_literal: true

require_relative '../lib/main'

# путь к файлу с пользовательской строкой
path = File.expand_path('../spec/support/fixtures/sample_data.txt', __dir__)

# если файла нет, то присваиваем nil
custom_string = File.exist?(path) ? File.read(path) : nil

MaxAmount::CLI.call(custom_string: custom_string)
