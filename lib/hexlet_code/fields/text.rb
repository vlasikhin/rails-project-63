# frozen_string_literal: true

module HexletCode
  module Fields
    class Text
      DEFAULTS = {
        cols: 20,
        rows: 40
      }.freeze

      def initialize(options)
        @value = options[:value]
        options = options.except(:value)
        @options = DEFAULTS.merge(options)
      end

      def render
        label + textarea
      end

      def label
        HexletCode::Tag.build('label', for: @options[:name]) { @options[:name].capitalize }
      end

      def textarea
        HexletCode::Tag.build('textarea', @options) { @value }
      end
    end
  end
end
