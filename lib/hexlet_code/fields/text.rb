# frozen_string_literal: true

module HexletCode
  module Fields
    class Text < HexletCode::Fields::BaseInput
      DEFAULTS = {
        cols: 20,
        rows: 40
      }.freeze

      def initialize(options)
        super
        @value = options[:value]
        options = options.except(:value)
        @options = DEFAULTS.merge(options)
      end

      def render
        label + textarea
      end

      def textarea
        HexletCode::Tag.build('textarea', @options) { @value }
      end
    end
  end
end
