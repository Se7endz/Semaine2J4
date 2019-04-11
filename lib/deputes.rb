require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def get_the_email_of_a_dep_from_its_webpage(url)
page = Nokogiri::HTML(open(url))
mail = []
mail << page.xpath('//*[@id="content"]/div[1]/ul[1]/li[5]/a[2]').text
#mail << page.xpath('///html/body/div[3]/div/div/section[2]/div/article/div[3]/section/dl[2]/dd[2]/a').text
return p mail
end

a = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes"
get_the_email_of_a_dep_from_its_webpage(a)

def get_the_dep_list
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes"))
dep1 = []
list = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes"
page.xpath('///html/body/h2').each do |z|
dep1 << list + z["h2"].to_s
end
return dep1[5..-1]
end

get_the_dep_list.each do |z|
	get_the_email_of_a_dep_from_its_webpage(z)
end
	