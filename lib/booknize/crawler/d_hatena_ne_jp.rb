module Booknize
  module Crawler
    class DHatenaNeJp < Base
      CONTENT = {h1: '.day > h2', div: ".section"}
    end
  end
end
