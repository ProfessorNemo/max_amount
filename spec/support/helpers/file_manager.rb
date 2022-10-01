# frozen_string_literal: true

require 'fileutils'

module Helpers
  def config_file
    File.expand_path('../../../spec/support/fixtures/sample_data.txt', __dir__)
  end

  def remove_config
    FileUtils.remove_file config_file if File.file?(config_file)
  end
end
