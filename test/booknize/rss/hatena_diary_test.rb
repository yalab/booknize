# -*- coding: utf-8 -*-
require 'test_helper'

module Booknize
  module RssTest
    class HatenaDiaryTest < Minitest::Test
      def setup
        Dir.glob(File.expand_path("../../../fixtures/hatena_diary/*", __FILE__)).each do |f|
          basename = File.basename(f)
          path = "d.hatena.ne.jp/rudeboyjet/#{basename}"
          if basename != 'rss'
            path += '/p1'
          end
          stub_request(:get, path).to_return(body: File.read(f))
        end
        @rss = Booknize::Rss.new("http://d.hatena.ne.jp/rudeboyjet/rss")
      end

      def test_get
        body = nil
        assert_equal 'よしだメモ', @rss.title
      end

      def test_to_epub
        path = "/tmp/test.epub"
        File.unlink(path) if File.exists?(path)
        @rss.to_epub("/tmp/test.epub")
        assert_equal true, File.exists?(path)
      end
    end
  end
end
