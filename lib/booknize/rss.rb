# -*- coding: utf-8 -*-
module Booknize
  class Rss
    delegate :title, to: :@channel

    def initialize(uri)
      body = nil
      open(uri) do |f|
        body = f.read
      end
      @uri = URI.parse(uri)
      @rss = RSS::Parser.new(body).parse
      @channel = @rss.channel
    end

    def to_epub(path)
      channel = @channel
      rss = @rss

      book = GEPUB::Book.new
      book.language = 'ja'
      book.set_main_id(@uri, 'BookID', 'URL')
      book.add_title(channel.title, nil, GEPUB::TITLE_TYPE::MAIN)

      book.ordered {
        rss.items.each.with_index(1) do |item, i|
          body = nil
          crawler = Booknize::Crawler.new(item.link)
          body = crawler.get.body
          book.add_item("text/#{i}.html").add_content(StringIO.new(body)).toc_text(item.title)
        end
      }

      book.generate_epub(path)
    end
  end
end
