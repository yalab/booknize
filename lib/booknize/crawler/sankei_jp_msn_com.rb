module Booknize
  module Crawler
    class SankeiJpMsnCom < Base
      CONTENT = {h1: '#NewsTitle', div: '.NewsTextFull', 'div.last-updated' => '.Timestamp'}
    end
  end
end

