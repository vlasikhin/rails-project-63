# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(options = {}, components = [])
      @options = options.dup
      @components = components
    end

    def render
      tags = @components.map { |options| create_tag(options).render }

      HexletCode::Tag.build('form', @options) { tags.join }
    end

    private

    def create_tag(options)
      attributes = options.except(:as)
      HexletCode.const_get(options[:as]).new(attributes)
    end
  end
end
