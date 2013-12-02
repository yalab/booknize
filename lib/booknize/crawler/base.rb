module Booknize
  module Crawler
    class Base
      attr_reader :document
      def initialize(uri)
        @uri = uri
      end

      def format!
        @document.css("script").map(&:remove)
        body = Nokogiri::XML::Node.new('body', @document)
        if self.class.const_defined?(:CONTENT)
          content_class = self.class.const_get(:CONTENT)
          content_class = [content_class] unless content_class.is_a?(Array)
          content_class.each do |klass|
            body << @document.css("#{klass}").children
          end
        end

        @document.css("body").first.replace(body)
        if self.class.const_defined?(:REMOVE)
          remove_class = self.class.const_get(:REMOVE)
          @document.css("#{remove_class}").remove
        end
        self
      end

      def content
        @document.inner_html
      end

      def get
        body = nil
        open(@uri) do |f|
          body = f.read
        end
        @document = Nokogiri::HTML.parse(body)
        self
      end

      def body
        format!.content
      end
    end
  end
end
