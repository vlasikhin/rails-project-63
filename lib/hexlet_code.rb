# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Builder, 'hexlet_code/builder.rb')

  class Error < StandardError; end

  def self.form_for(object, options = {}, &)
    inputs = Builder.new(object)

    yield inputs if block_given?

    Tag.build('form', action: options[:url] || '#', method: 'post') { inputs.fields&.join }
  end
end
