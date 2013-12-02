module Booknize
  module Crawler
    class WwwTokyoNpCoJp < Base
      CONTENT = {h1: '.News-headarea h1', div: ".Text p"}
    end
  end
end
