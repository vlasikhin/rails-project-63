# frozen_string_literal: true

module HexletCode
  class Builder
    attr_accessor :fields
    attr_reader :object

    def initialize(object = nil)
      @fields = []
      @object = object
    end

    def input(name, options = {})
      value = ""
      value = object.public_send(name) unless object.nil?

      fields << if options[:as] == :text
                  Tag.build("textarea", cols: 20, rows: 40, name:) { value }
                else
                  Tag.build("input", name:, type: "text", value:)
                end
    end
  end
end
