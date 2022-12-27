# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload(:Tag, "hexlet_code/tag.rb")
  autoload(:Builder, "hexlet_code/builder.rb")

  class Error < StandardError; end

  def self.form_for(object, options = {}, &)
    url = options[:url] || "#"
    builder = Builder.new(object)
    fields = block_given? ? yield(builder) : []
    Tag.build("form", action: url, method: "post") { fields&.join }
  end
end
