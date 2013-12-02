module Booknize
  module Crawler
    class Www47newsJp < Base
      CONTENT = {h1: '#bt_title a', div: '#bt_body', 'div.last-updated' => '.ta_r'}
    end
  end
end
