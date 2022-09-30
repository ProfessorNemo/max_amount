# frozen_string_literal: true

require_relative 'max_amount/version'

require 'byebug'
require 'optparse'
require 'securerandom'
require 'dotenv/load'

require_relative 'max_amount/options'
require_relative 'max_amount/cli'
require_relative 'max_amount/errors'
require_relative 'max_amount/extract_integer'
