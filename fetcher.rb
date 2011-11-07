require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'
doc=Nokogiri::HTML(open("https://www.ruby-toolbox.com/categories"))
arr = doc.css('#content ul.group_items>li').collect(&:text).collect{|i| i.split("\n\n")}
print "source 'http://rubygems.org'\n"
arr.each do |arr2|
  arr2[0]=arr2[0].split("\n").join('')
  # print "##{arr2[0]}\n"
  gem = arr2[1].split(", ").first
  begin
    next if gem=='and 1 more'
    if gem =~ /^and (.*)$/
      gem = $1
    end
    gem = gem.split("\n")[-1]
    gem = gem.downcase.split(' ').join('_')
    print "gem '#{gem}'\n"
  rescue Exception => e
    p e
  end
end
