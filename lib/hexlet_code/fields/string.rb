# frozen_string_literal: true

module HexletCode
  module Fields
    class String
      DEFAULTS = {
        type: :text
      }.freeze

      def initialize(options)
        @options = DEFAULTS.merge(options)
      end

      def render
        label + input
      end

      def label
        HexletCode::Tag.build('label', for: @options[:name]) { @options[:name].capitalize }
      end

      def input
        HexletCode::Tag.build('input', @options)
      end
    end
  end
end
