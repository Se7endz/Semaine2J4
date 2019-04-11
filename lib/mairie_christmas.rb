require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def get_the_email_of_a_townhal_from_its_webpage(url)
page = Nokogiri::HTML(open(url))
mail = []
town_name = []
mail << page.xpath('///html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
town_name << page.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text

puts mail
puts town_name
hash1 = Hash[town_name.zip(mail)]

return hash1
end

a = "http://www.annuaire-des-mairies.com/95/avernes.html"
get_the_email_of_a_townhal_from_its_webpage(a)

def get_the_town_list
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))
ville = []
list = "http://annuaire-des-mairies.com/95/"
page.xpath('/html/body/pre/a').each do |td|
ville << list + td["href"]
end
return ville[5..-1]
end

get_the_town_list.each do |x|
	get_the_email_of_a_townhal_from_its_webpage(x)
end