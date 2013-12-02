module Booknize
  module Crawler
    class JpWsjCom < Base
      CONTENT = [".articleHeadlineBox", ".articlePage"]
      REMOVE = '#adJapan BusinessL'
    end
  end
end
