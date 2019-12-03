# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FFmpeger::FFmpeg::FFprobe do
  subject { described_class.new }

  it 'has a version' do
    raise unless subject.version
  end

  it 'gets the version by executing the ffprobe command' do
    stubbed_version = Sample.new('ffprobe_version_4.1.3-0ubuntu1.txt').get
    expect(subject).to receive(:`)
      .with('ffprobe -version')
      .once
      .and_return(stubbed_version)
    expect(subject.version.to_s).to eq('4.1.3-0ubuntu1')
  end

  it '(ff)probes media file' do
    stubbed_probe = Sample.new('ffprobe_probe.txt')
    expected_command = "ffprobe #{described_class::PROBE_OPTIONS} any_file"
    expect(subject).to receive(:`)
      .with(expected_command)
      .once
      .and_return(stubbed_probe)
    expect(subject.probe('any_file')).to eq(stubbed_probe)
  end
end
