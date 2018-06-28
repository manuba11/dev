#/usr/bin/ruby
# coding:utf-8

require 'open-uri'
require 'nokogiri'

url = 'http://kakaku.com/search_results/Core+i7+8086K/'
charset = 'Shift_JIS'

html = open(url) do |f|
    f.read
end

doc = Nokogiri::HTML(html, nil, charset)


