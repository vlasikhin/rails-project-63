# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(associated_object)
      @object = associated_object
    end

    def build(form_options = {})
      @form = HexletCode::Form.new(form_options)

      yield(self) if block_given?

      @form
    end

    def input(attribute_name, options = {})
      label(for: attribute_name)

      options = { as: :string }.merge(options)
      options[:as] = "Fields::#{options[:as].capitalize}Input"
      options[:name] = attribute_name
      options[:value] = @object.public_send(attribute_name)

      @form.add_component(options)
    end

    def submit(name = 'Save', options = {})
      options = options.dup
      options[:value] = name
      options[:name] = :commit
      options[:type] = :submit
      options[:as] = 'Fields::Submit'

      @form.add_component(options)
    end

    def label(options = {})
      options = options.dup
      options[:as] = 'Fields::Label'

      @form.add_component(options)
    end
  end
end
