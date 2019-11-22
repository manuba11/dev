#/usr/bin/ruby
## coding:utf-8
#
##Study of Array and Hush

require "json"

#https://uxmilk.jp/13387

File.open("sample.json") do |j|
  hash = JSON.load(j)
  #puts hash
  hash.each {|i|
    puts "コース名：" + i["cource_name"]
    puts "HTMLファイル名：" + i["cource_html"]
    puts "定員：" + i["capacity"].to_s
    puts "最少人数：" + i["minimum"].to_s
    if i["cource"].length > 0 then
      i["cource"].each do |i|
        puts i["cource_id"]
        i["schedule"].each do |t|
          print "     "
          for num in 0..t.length - 1 do
            print t[num] + " "
          end
          print "\n"
        end
      end
    else
      puts "受講可能なコースがありません"
    end
    puts "\n"
    #puts i[""]
  }


  #puts ret.length

  #json_str = JSON.pretty_generate(hash)
  #puts json_str
end


