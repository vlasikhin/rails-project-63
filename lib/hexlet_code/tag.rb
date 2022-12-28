# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attributes = {}, &)
      new(name, attributes, &).to_s
    end

    def initialize(name, attributes = {}, &body)
      @name = name
      @attributes = attributes
      @body = body
    end

    def to_s
      content = @body ? @body.call : ""

      return "<#{@name}#{attributes}>" if empty_tags.include?(@name)

      "<#{@name}#{attributes}>#{content}</#{@name}>"
    end

    private

    def attributes
      return "" if @attributes.empty?

      @attributes.map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end

    def empty_tags
      %w[br hr img meta input]
    end
  end
end
