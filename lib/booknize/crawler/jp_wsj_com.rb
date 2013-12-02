module Booknize
  module Crawler
    class JpWsjCom < Base
      CONTENT = {h1: '.articleHeadlineBox h1', div: '.articlePage', 'div.last-updated' => ".dateStamp"}
    end
  end
end
