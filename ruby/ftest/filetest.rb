#!/usr/bin/ruby
#coding:utf-8

puts Dir.pwd

Dir.glob("/**/*").each do |f|
	puts Dir.pwd + "/" + f
end

#fSample = File.open("sample.txt", "a")
#if fSample != nil then
#	fSample.puts("hello")
#else
#	puts("Can't open file")
#end

#simple read-------------------------------------------
#begin
#	File.open("name.txt", "r")do |f|
#		f.each_line do |l|
#			puts l
#		end
#	end
#
#rescue SystemCallError => e
#  puts %Q(class=[#{e.class}] message=[#{e.message}])
#rescue IOError => e
#  puts %Q(class=[#{e.class}] message=[#{e.message}])
#
#end

##file exist ---------------------------------------------
#p FileTest.exist?("name1.txt")
#

##Get file name --------------------------
## Use "\\" in dos platform. In linux use "/".
#p File.basename("c:/sample.txt")
##=> sample.txt
#

##File wo reltukyosuru
#Dir.glob("*.*").each do |f|
#	puts f
#end

##puts Dir.methods.sort
#puts (Dir.home)


#get mpeg4 file lists
#curDir = Dir.pwd
#puts curDir
#

