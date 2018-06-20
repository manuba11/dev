#!/usr/bin/ruby
#coding:utf-8

#get perts price program for kakaku.com
#edit:2017/02/21
#edit:2017/03/31
#edit:2018/06/12

#load lib
require 'open-uri'
require 'nokogiri'

#do process with nokogiri
def doscraping(url)
    #target SHOP Array
    shoplist = Array["PCSHOPアーク","TSUKUMO","ソフマップ","ソフマップ.com","ドスパラ","ヨドバシ.com","ビックカメラ","ビックカメラ.com","Amazon.co.jp"]

    #Read here.
    #http://blog.sushi.money/entry/20110215/1297739278

    charset = "Shift_JIS" #kakaku.com
    #read page
    html = open(url) do |f|
        f.read
    end
    #
    doc = Nokogiri::HTML.parse(html, nil, charset)
    #
    print doc.xpath("//*[@id='makerSeries']/li[1]/div/span/span/a/span").text + " "
    print doc.xpath("//*[@id='p-PTShopData_name_link']").text
    
end

#search with file
def searchwithfile(fname) 
    if fname != nil then
        File.open(Dir.pwd + "/" + fname) do |file|
            file.read.split("\n").each do |kakakuurl|
                doscraping(kakakuurl)
                puts ""
            end
        end
    else
        puts "Please inter the filename of url adress list"
    end
end

#search with url
def searchwithurl(url)
    if url != nil then
        doscraping(url)
    else
        puts "Please inter the right url of kakaku.com"
    end
end

if ARGV[0] != nil then
    case ARGV[0]
    when "-u" then
        searchwithurl(ARGV[1])
    when "-f" then
        searchwithfile(ARGV[1])
    end
else
    puts "Usage:"
    puts "gpp -u http://kakaku.com/item/K0000897081/"
    puts "gpp -f pricelist.txt"
end

