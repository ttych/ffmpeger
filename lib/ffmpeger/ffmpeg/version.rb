# frozen_string_literal: true

module FFmpeger
  module FFmpeg
    Version = Struct.new(:major, :minor, :patch, :tag) do
      def to_s
        "#{major}.#{minor}.#{patch}-#{tag}"
      end
    end
  end
end
