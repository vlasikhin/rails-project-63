# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput
      DEFAULTS = {
        cols: 20,
        rows: 40
      }.freeze

      attr_reader :options

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
