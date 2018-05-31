#!/usr/bin/ruby
#coding: utf-8
#

def fact(n)
	if n==0 then
		return 1
	else
		n*fact(n-1)
	end
end

=begin
puts fact(0)
puts fact(1)
puts fact(2)
puts fact(3)
puts fact(4)
puts fact(5)
puts fact(6)
=end

for lp in 1..10 do
	puts fact(lp)
end





