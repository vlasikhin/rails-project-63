# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :components

    def initialize(associated_object, components = [])
      @object = associated_object
      @components = components
    end

    def input(attribute_name, options = {})
      options = { as: :string }.merge(options)
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      add_component(options)
    end

    def submit(name = 'Save', options = {})
      options = options.dup
      options[:value] = name
      options[:name] = :commit
      options[:type] = :submit
      options[:as] = :submit

      add_component(options)
    end

    def label(options = {})
      options = options.dup
      options[:as] = :label

      add_component(options)
    end

    private

    def add_component(options)
      @components << options
    end
  end
end
