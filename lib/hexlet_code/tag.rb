# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br hr img meta input].freeze

    def self.build(tag_name, options = {}, &)
      start_tag = "<#{tag_name}#{attrs(options)}>"

      return start_tag if SINGLE_TAGS.include?(tag_name)

      content = yield if block_given?
      end_tag = "</#{tag_name}>"

      [start_tag, content, end_tag].compact.join
    end

    def self.attrs(options)
      return '' if options.empty?

      options.map { |key, value| " #{key}=\"#{value}\"" }.join
    end
  end
end
