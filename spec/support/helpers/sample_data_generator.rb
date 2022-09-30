# frozen_string_literal: true

module Helpers
  class SampleDataGenerator
    include Helpers

    DEFAULT_BYTES_COUNT = 1_000
    DEFAULT_FILE_PATH = File.expand_path('../../../spec/support/fixtures/sample_data.txt', __dir__)
    # SAMPLE_CHARS = [*('a'..'z'), *('A'..'Z'), *('0'..'9'), "\n", '!', '@', '#', '%', '$', '&'].freeze
    SOURCE = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + ['_', '-', '.', "\n", '!', '@', '#', '%', '$', '&']

    def initialize(options = {})
      @bytes_count = options.fetch(:bytes_count, DEFAULT_BYTES_COUNT)
      @file_path = options.fetch(:file_path, DEFAULT_FILE_PATH)
    end

    # def call
    #   File.open(@file_path, 'w') do |f|
    #     @bytes_count.times do
    #       f.write(random_char)
    #     end
    #   end
    #   File.read @file_path
    # end

    def call
      File.write(@file_path, random_string)
      File.read @file_path
    end

    private

    def random_char
      SAMPLE_CHARS.sample(1).join
    end

    def random_string
      key = ''
      DEFAULT_BYTES_COUNT.times { key += SOURCE[rand(SOURCE.size)].to_s }
      key
    end
  end
end
