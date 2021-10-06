# frozen_string_literal: true

# Entrypoint

$LOAD_PATH.unshift(File.dirname(__FILE__), 'lib')
require 'file_reader'

FileReader.new(ARGV[0]).process_input
