module Booknize
  module Crawler
    class MainichiJp < Base
      CONTENT = {h1: ".NewsTitle a", div: '.NewsBody', :'div.credit' => '.Credit'}
    end
  end
end
