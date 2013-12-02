module Booknize
  module Crawler
    class WwwAsahiCom < Base
      CONTENT = {h1: '.ArticleTitle h1', div: '.ArticleText > p', :'div.LastUpdated' => '.LastUpdated'}
    end
  end
end
