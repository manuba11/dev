#!/usr/bin/ruby
# -- coding:utf-8

#Load library
require 'open-uri'
require 'nokogiri'

#Processing of scraping with nokogiri
def doscraping(url)
    #Read here.
    #http://blog.sushi.money/entry/20110215/1297739278

    #Character code of kakaku.com is Shift-JIS.
    charset = "Shift_JIS"

    #Read page
    html = open(url) do |f|
        f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    #Search path with class name 'p-PTShopData_name'
    for i in doc.xpath("//p[@class='p-PTShopData_name']/a") do
        puts i.class
    end
end

#Processing the URL list file.
def searchwithfile(fname) 
    if fname != nil then
        File.open(Dir.pwd + "/" + fname) do |file|
            file.read.split("\n").each do |kakakuurl|
                doscraping(kakakuurl)
                puts ""
            end
        end
    else
        puts "Please enter the filename of url adress list"
    end
end

#Processing of URL.
def searchwithurl(url)
    if url != nil then
        doscraping(url)
    else
        puts "Please enter the right url of kakaku.com"
    end
end

#Processing of keyword search.
def searchwithkeyword(keyword)
    if keyword != nil then
        url = "http://kakaku.com/search_results/"
        charset = "Shift_JIS" #kakaku.com
        #"<<" is faster than concatenating with "+".
        html = open(url << keyword.gsub(/\s/, '+') << "/") do |f|
            f.read
        end

        doc = Nokogiri::HTML.parse(html, nil, charset)

        #NList of products searched by keyword.
#        for i in doc.xpath("//div[@class='iviewbtn']") do
#            puts i.text
#        end
#
#        for i in doc.xpath("//a[@class='noscriptLink']") do
#            puts i.attribute("href")
#        end

#        for i in doc.xpath("//p[@class='itemnameN']") do
#            puts i.text
#        end
#http://blog.takuros.net/entry/2014/04/15/070434
        puts doc/'//title'
        puts doc%'//title'
        puts doc.at('//title')
        puts doc.at_xpath('//title')
        puts doc.xpath('//title')
        puts doc.xpath('//title')[0]
        puts doc.xpath('//title').first
        puts doc.xpath('//title').text
        puts doc.xpath('//title')[0].text
        puts doc.xpath('//title').first.text
    else
       puts "Please enter the right keyword"
       puts "If the keyword contains spaces, please join with '+'"
    end

end

#If there is an argument, branch processing.
if ARGV[0] != nil then
    case ARGV[0]
    #In the case of URL.
    when "-u" then
        searchwithurl(ARGV[1])
    #In the case of file.
    when "-f" then
        searchwithfile(ARGV[1])
    #In the case of keyword.
    when "-k" then
        searchwithkeyword(ARGV[1])
    else
        
    end
else
    #Show how to use the 'gpp.rb'
    puts "Usage:"
    puts "gpp -k 'GeForce GTX 1060'"
    puts "gpp -f pricelist.txt"
    puts "gpp -u http://kakaku.com/item/K0000897081/"
end

