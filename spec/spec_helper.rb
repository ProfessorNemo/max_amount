# frozen_string_literal: true

require 'simplecov'

# SimpleCov.start
# Запуск измерителя покрытия кода тестами с игнорированием некоторых директорий:
SimpleCov.start do
  add_filter 'spec/'
  add_filter '.github/'
end

# Если тесты работают на "Continuous Integration", то данные затем отрпавить на сервис "Codecov"
if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

# $ xdg-open coverage/index.html
# "$ echo coverage >> .gitignore" - чтобы git не отслеживал рез-ты покрытия

require_relative '../lib/main'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].each { |f| require f }

RSpec.configure do |config|
  config.include Helpers

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
