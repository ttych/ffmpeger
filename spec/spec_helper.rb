# frozen_string_literal: true

require 'bundler/setup'
require 'ffmpeger'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

class Sample
  SAMPLES_DIR = File.join(File.dirname(__FILE__), 'samples')

  def initialize(name)
    @sample_name = name
  end

  def get
    File.read(File.join(SAMPLES_DIR, @sample_name))
  end
end
