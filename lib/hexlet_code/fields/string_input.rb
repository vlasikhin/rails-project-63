# frozen_string_literal: true

module HexletCode
  module Fields
    class StringInput
      DEFAULTS = {
        type: :text
      }.freeze

      def initialize(options)
        @options = DEFAULTS.merge(options)
      end

      def render
        HexletCode::Tag.build('input', @options)
      end
    end
  end
end
