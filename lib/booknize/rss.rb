module Booknize
  class Rss
    delegate :title, to: :@channel

    def initialize(uri)
      body = nil
      open(uri) do |f|
        body = f.read
      end
      @rss = RSS::Parser.new(body).parse
      @channel = @rss.channel
    end
  end
end
