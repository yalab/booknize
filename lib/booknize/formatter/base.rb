module Booknize
  module Formatter
    class Base
      attr_reader :document
      def initialize(body)
        @document = Nokogiri::HTML.parse(body)
        @document.css("script").map(&:remove)
      end

      def content
        @document.inner_html
      end
    end
  end
end
