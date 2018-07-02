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
#The main processing routine of gpp. 
def doscraping(url)
    #Read here.
    #http://blog.sushi.money/entry/20110215/1297739278

    #Character code of kakaku.com is Shift-JIS.
    charset = "Shift_JIS"

    listShop = Array["PCSHOPアーク","TSUKUMO","ソフマップ","ソフマップ.com","ドスパラ","ヨドバシ.com","ビックカメラ","ビックカメラ.com","Amazon.co.jp"]
   #Read page
    html = open(url) do |f|
        f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    #Search path with class name 'p-PTShopDaata_name'
    doc.xpath("//table[@class='p-priceTable']//tr").each do |i|
        #nilオブジェクトでない場合（これがないとエラーになる）
        if i.at("p[@class='p-PTPrice_price']").nil? == false then
            listShop.each do |f|
                if i.at("a[@class='p-PTShopData_name_link']").text.chomp.include?(f) == true then
                    print f <<  " "
                    puts i.at("p[@class='p-PTPrice_price']").text.gsub(/\xc2\xa5|\,/, "")
                end
            end
        end
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
        rankUrl = 0
        urlResult = [0, "", ""] 
        #"<<" is faster than concatenating with "+".

        #If there is space character, replace with '+'/スペースがある場合'+'に置換する
        html = open(urlKakaku << keyword.gsub(/\s/, '+') << "/") do |f|
            f.read
        end

        doc = Nokogiri::HTML.parse(html, nil, charset)

        #List of products searched by keyword.
        #http://blog.takuros.net/entry/2014/04/15/070434
        #NodeSet Object
        #Element Object
        doc.xpath("//div[@class='itemBg clearfix']").each do |node|
            urlGoods = node.xpath(".//a").attribute("href").value
            if urlGoods.index("item") != nil then
                nameGoods = node.xpath(".//img").attribute("alt").value
                #Using Trigram for calculate similarity of search keyword.
                rankUrl = Trigram.compare(keyword, nameGoods)
                if urlResult[0] < rankUrl then
                   urlResult[0] = rankUrl
                   urlResult[1] = nameGoods
                   urlResult[2] = urlGoods
                end
            end
        end
        puts "----------"
        urlResult.each do |f|
            puts f
        end
        puts "----------"
        if urlResult[2] != nil then
            puts "\n"
            doscraping(urlResult[2])
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

