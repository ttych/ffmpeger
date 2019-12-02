# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FFmpeger::FFmpeg::VersionParser do
  it 'extracts version from version output' do
    version_output = Sample.new('ffprobe_version_4.1.3-0ubuntu1.txt').get
    expect(described_class.new(version_output).parse.to_s)
      .to eq('4.1.3-0ubuntu1')
  end
end
