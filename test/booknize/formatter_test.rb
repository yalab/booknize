require 'test_helper'

module Booknize
  class FormatterTest < Minitest::Test
    def test_hatena_diary
      const = Booknize::Formatter.get("d.hatena.ne.jp")
      assert_equal Booknize::Formatter::HatenaDiary, const
    end
  end
end
