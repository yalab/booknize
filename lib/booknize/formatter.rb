module Booknize
  module Formatter
    class << self
      FORMATTER = {
        'd.hatena.ne.jp' => 'HatenaDiary'
      }

      def get(hostname)
        if f = FORMATTER[hostname]
          require File.expand_path("../formatter/#{f.underscore}", __FILE__)
          self.const_get(f)
        end
      end
    end
  end
end
