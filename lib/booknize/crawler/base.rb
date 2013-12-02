module Booknize
  module Crawler
    class Base
      attr_reader :document
      def initialize(uri)
        @uri = uri
      end

      def format!
        @document.css("script, style, link").map(&:remove)
        body = Nokogiri::XML::Node.new('body', @document)
        if contents = self.class.const_defined?(:CONTENT) && self.class.const_get(:CONTENT)
          contents.each do |tag, klass|
            node = Nokogiri::XML::Node.new(tag.to_s, @document)
            children = @document.css(klass)
            if (tag == :h1 && klass =~ /#{tag}$/) || klass  =~ /a$/
              children = children.children
            end
            node.children = children
            body << node
          end
        end

        @document.css("body").first.replace(body)
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
