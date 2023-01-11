# frozen_string_literal: true

module HexletCode
  module Fields
    class BaseInput
      def initialize(options)
        @options = options
      end

      def label
        HexletCode::Tag.build('label', for: @options[:name]) { @options[:name].capitalize }
      end
    end
  end
end
