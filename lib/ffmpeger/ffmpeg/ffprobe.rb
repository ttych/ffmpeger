# frozen_string_literal: true

module FFmpeger
  module FFmpeg
    # wrapper for ffprobe executable
    class FFprobe
      FFPROBE = 'ffprobe'
      PROBE_OPTIONS = '-v quiet \
                         -print_format json \
                         -show_format \
                         -show_streams \
                         -show_error \
                         -show_chapters'

      attr_reader :ffprobe

      def initialize(ffprobe = FFPROBE)
        @ffprobe = ffprobe
      end

      def probe(filename, options = PROBE_OPTIONS)
        `#{ffprobe} #{options} #{filename}`
      end

      def version
        @version ||= VersionParser.new(version_output).parse
      end

      def version_output
        @version_output ||= `#{ffprobe} -version`
      end
    end
  end
end
