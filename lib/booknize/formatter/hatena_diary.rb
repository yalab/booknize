module Booknize
  module Formatter
    class HatenaDiary < Base
      def format!
        body = Nokogiri::XML::Node.new('body', @document)
        body << @document.css('.section').children
        @document.css("body").first.replace(body)
        self
      end
    end
  end
end
