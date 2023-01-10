# frozen_string_literal: true

module HexletCode
  module Fields
    class TextInput
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
        HexletCode::Tag.build('textarea', @options) { @value }
      end
    end
  end
end
