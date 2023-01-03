# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Fields, 'hexlet_code/fields.rb'
  autoload :Form, 'hexlet_code/form.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :Inputs, 'hexlet_code/inputs.rb'
  autoload :Tag, 'hexlet_code/tag.rb'

  def self.form_for(object, options = {}, &)
    form_options = {
      action: options[:url] || '#',
      method: options[:method] || 'post'
    }

    FormBuilder.new(object).build(form_options, &).render
  end
end
