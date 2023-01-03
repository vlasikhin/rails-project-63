# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br hr img meta input].freeze

    def self.build(tag_name, options = {}, &)
      start_tag = if options.empty?
                    "<#{tag_name}>"
                  else
                    "<#{tag_name} #{options.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")}>"
                  end

      content   = yield if block_given?
      end_tag   = "</#{tag_name}>"

      SINGLE_TAGS.include?(tag_name) ? start_tag : [start_tag, content, end_tag].compact.join
    end
  end
end
