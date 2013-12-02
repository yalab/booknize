# -*- coding: utf-8 -*-
require 'test_helper'

module Booknize
  module Fomratter
    class HatenaDiaryTest < Minitest::Test
      def setup
        body = File.read(File.expand_path("../../../fixtures/hatena_diary/20111003", __FILE__))
        @formatter = Booknize::Formatter.get("d.hatena.ne.jp").new(body)
      end

      def test_format
        assert_equal 'h3', @formatter.format!.document.css('body').first.children[1].name
      end
    end
  end
end
