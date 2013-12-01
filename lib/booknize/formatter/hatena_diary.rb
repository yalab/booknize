module Booknize
  module Formatter
    class HatenaDiary
      attr_reader :document
      def initialize(body)
        @document = Nokogiri::HTML.parse(body)
      end

      def format!
        body = Nokogiri::XML::Node.new('body', @document)
        body << @document.css('.section').children
        @document.css("body").first.replace(body)
        self
      end

      def content
        @document.inner_html
      end
    end
  end
end
