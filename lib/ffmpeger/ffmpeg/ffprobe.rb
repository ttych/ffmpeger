# frozen_string_literal: true

module FFmpeger
  module FFmpeg
    # wrapper for ffprobe executable
    class FFprobe
      def version
        @version ||= VersionParser.new(version_output).parse
      end

      def version_output
        @version_output ||= `ffprobe -version`
      end
    end
  end
end
