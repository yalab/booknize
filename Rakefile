$LOAD_PATH << File.expand_path("../test", __FILE__)
require "bundler/gem_tasks"
require "rake/testtask"
require 'open-uri'
require 'rss'
require 'rack/utils'
require 'booknize/rss/google_news_test'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*test*.rb']
  t.verbose = true
end

task :default => ["test:setup", :test]

namespace :test do
  task :setup do
    WebMock.allow_net_connect!
    dir = File.expand_path('../test/fixtures/google_news', __FILE__)
    Booknize::RssTest::GoogleNewsTest::FIXTURES.each do |name, uri|
      path = dir + '/' + name
      open(uri) do |f|
        File.write(path, f.read) unless File.exists?(path)
      end
      rss = RSS::Parser.parse(File.read(path))
      rss.items.each do |item|
        uri = URI.parse(item.link)
        path =  dir + '/' + Rack::Utils.parse_query(uri.query)['usg']
        open(uri) do |f|
          File.write(path, f.read) unless File.exists?(path)
        end
      end
    end
    WebMock.disable_net_connect!
  end
end
