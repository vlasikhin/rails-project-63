# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(options = {})
      @options = options.dup
      @component_options = []
    end

    def add_component(options)
      @component_options << options
    end

    def render
      tags = @component_options.map { |options| create_tag(options).render }

      HexletCode::Tag.build('form', @options) { tags.join }
    end

    private

    def create_tag(options)
      attributes = options.except(:as)
      HexletCode.const_get(options[:as]).new(attributes)
    end
  end
end
