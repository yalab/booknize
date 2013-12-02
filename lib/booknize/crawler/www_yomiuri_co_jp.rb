module Booknize
  module Crawler
    class WwwYomiuriCoJp < Base
      CONTENT = {h1: '.article-def > h1', div: '.article-def > p', :'div.date-def' => '.date-def'}
    end
  end
end
