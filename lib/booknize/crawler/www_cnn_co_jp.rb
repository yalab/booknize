module Booknize
  module Crawler
    class WwwCnnCoJp < Base
      CONTENT = {h1: '.headline-lrg', div: '#leaf-body > p'}
    end
  end
end
