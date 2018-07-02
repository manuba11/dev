#!/usr/bin/ruby
# -- coding:utf-8
#2018/06/29
#2018/07/02

#Load library
#require 'rubygems'
require 'open-uri'
require 'nokogiri'
#Similarity of keywords
require 'trigram'

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

    #Search path with class name 'p-PTShopDaata_name'
    doc.xpath("//table[@class='p-priceTable']//tr").each do |i|
        if i.at("p[@class='p-PTPrice_price']").nil? == false then
            print i.at("a[@class='p-PTShopData_name_link']").text.chomp << " "
            puts i.at("p[@class='p-PTPrice_price']").text
        end
#            puts i.text
#        i.empty? do
#            puts i.xpath(".//p[@class='p-PTPrice_price']").text
#        i.xpath("p[@class='p-PTPrice_price']").nil? do
#        end
#        print i.at("p[@class='p-PTPrice_price']").to_s
#        print " "
#        puts i.content("a[@class='p-PTShopData_name_link']")
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
    urlKakaku = "http://kakaku.com/search_results/"
        charset = "Shift_JIS" #kakaku.com
        #"<<" is faster than concatenating with "+".

        #スペースがある場合'+'に置換する
        html = open(urlKakaku << keyword.gsub(/\s/, '+') << "/") do |f|
            f.read
        end

        doc = Nokogiri::HTML.parse(html, nil, charset)

        #List of products searched by keyword.
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
#NodeSet Object
#Element Object
        doc.xpath("//div[@class='itemBg clearfix']").each do |node|
            #puts node.xpath(".//a[@class='selfLink']").attribute("href").text
            #puts node.at("a").attribute("href").value
            urlGoods = node.xpath(".//a").attribute("href").value
            if urlGoods.index("item") != nil then
                nameGoods = node.xpath(".//img").attribute("alt").value
                    print keyword
                    puts " <=> " + nameGoods
                    print " --> "
                    #Using Trigram for calculate similarity of search keyword.
                    puts Trigram.compare(keyword, nameGoods)
#                puts '<a href="' << urlGoods << '">' << nameGoods << '</a>'

            end
        end
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

