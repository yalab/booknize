require 'booknize/crawler/base'

module Booknize
  module Crawler
    class << self
      def new(link)
        uri = URI.parse(link)
        host = case uri.host
               when 'news.google.com'
                 URI.parse(Rack::Utils.parse_query(uri.query)['url']).host
               else
                 uri.host
               end
        name = host.gsub('.', '_').underscore
        file = File.expand_path("../crawler/#{name}.rb", __FILE__)
        crawler = if File.exists?(file)
                    require file
                    Booknize::Crawler.const_get(name.classify)
                  else
                    Booknize::Crawler::Base
                  end
        crawler.new(uri)
      end
    end
  end
end
