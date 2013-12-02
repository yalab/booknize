module Booknize
  module Crawler
    class WwwFukuishimbunCoJp < Base
      CONTENT = {h1: '#bt_title span', div: '#NewsDetailBlock', 'div.credit' => '.Date'}
    end
  end
end
