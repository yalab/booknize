# -*- coding: utf-8 -*-
require 'test_helper'

module Booknize
  module RssTest
    class GoogleNewsTest < Minitest::Test
      FIXTURES = {'rss' => "http://news.google.com/news?hl=ja&ned=us&ie=UTF-8&oe=UTF-8&output=rss"}

      def setup
        dir = File.expand_path('../../../fixtures/google_news', __FILE__)
        FIXTURES.each do |fname, uri|
          path = dir + '/' + fname
          uri = URI.parse(uri)
          stub_request(:get, uri.host + uri.path)
            .with(query: Rack::Utils.parse_query(uri.query))
            .to_return(body: File.read(path))
          rss = RSS::Parser.parse(File.read(path))
          rss.items.each do |item|
            uri = URI.parse(item.link)
            fname =  Rack::Utils.parse_query(uri.query)['usg']
            path = dir + '/' + fname
            stub_request(:get, uri.host + uri.path)
              .with(query: Rack::Utils.parse_query(uri.query))
              .to_return(body: File.read(path))
          end
        end
        @rss = Booknize::Rss.new(FIXTURES['rss'])
      end

      def test_to_epub
        @rss.to_epub("/tmp/google_news.epub")
      end
    end
  end
end
