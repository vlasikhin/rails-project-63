# frozen_string_literal: true

module HexletCode
  module Fields
    class String < HexletCode::Fields::BaseInput
      DEFAULTS = {
        type: :text
      }.freeze

      def initialize(options)
        super
        @options = DEFAULTS.merge(options)
      end

      def render
        label + input
      end

      def input
        HexletCode::Tag.build('input', @options)
      end
    end
  end
end
