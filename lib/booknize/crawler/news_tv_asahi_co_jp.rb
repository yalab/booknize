module Booknize
  module Crawler
    class NewsTvAsahiCoJp < Base
      CONTENT = {h1: '#news_title', div: '#news_body'}
    end
  end
end
