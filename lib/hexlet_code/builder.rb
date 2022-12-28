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

      fields << label(name)
      fields << if options.delete(:as) == :text
                  default_options = { cols: 20, rows: 40, name: }

                  Tag.build("textarea", default_options.merge(options)) { value }
                else
                  default_options = { name:, type: "text", value: }

                  Tag.build("input", default_options.merge(options))
                end
    end

    def submit(name = "Save")
      fields << Tag.build("input", type: "submit", value: name)
    end

    def label(name)
      Tag.build("label", for: name) { name.capitalize }
    end
  end
end
