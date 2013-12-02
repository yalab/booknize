module Booknize
  module Crawler
    class WwwJijiCom < Base
      CONTENT = {h1: '#article-title h1', div: ".article-body"}
    end
  end
end
