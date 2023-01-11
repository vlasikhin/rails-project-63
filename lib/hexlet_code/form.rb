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
      field_class = "HexletCode::Fields::#{options[:as].capitalize}"
      HexletCode.const_get(field_class).new(attributes)
    end
  end
end
