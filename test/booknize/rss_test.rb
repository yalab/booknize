# -*- coding: utf-8 -*-
require 'test_helper'

module Booknize
  class RssTest < Minitest::Test
    def setup
      stub_request(:get, "d.hatena.ne.jp/rudeboyjet/rss").to_return(body: File.read(File.expand_path("../../fixtures/rss", __FILE__)) )
    end

    def test_get
      body = nil
      rss = Booknize::Rss.new("http://d.hatena.ne.jp/rudeboyjet/rss")
      assert_equal 'よしだメモ', rss.title
    end
  end
end
