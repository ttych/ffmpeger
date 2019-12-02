# frozen_string_literal: true

module FFmpeger
  module FFmpeg
    # extract semver version from ffmpeg -version output
    class VersionParser
      VERSION_REGEXP = /^(?:ffprobe|ffmpeg)\s
                          version\s(\d+)\.?(\d+)\.?(\d+)(?:-(\w+))?/x.freeze

      def initialize(output)
        @output = output
      end

      def parse
        output.match(VERSION_REGEXP) do |match|
          Version.new(*match[1..4])
        end
      end

      private

      attr_reader :output
    end
  end
end
