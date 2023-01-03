# frozen_string_literal: true

module HexletCode
  module Fields
    class Label
      def initialize(options)
        @options = options.dup
      end

      def render
        HexletCode::Tag.build('label', @options) { @options[:for].capitalize }
      end
    end
  end
end
