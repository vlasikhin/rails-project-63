# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :components

    def initialize(associated_object)
      @object = associated_object
      @components = []
    end

    def input(attribute_name, options = {})
      options = { as: :string }.merge(options)
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      @components << options
    end

    def submit(name = 'Save', options = {})
      @components << { value: name, name: :commit, type: :submit, as: :submit }.merge(options)
    end
  end
end
