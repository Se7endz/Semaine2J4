require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)

  page = Nokogiri::HTML(open(townhall_url)) 

    email_avernes = []

    town_names = []

    town_names << page.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text

    email_avernes << page.xpath('///html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

    puts town_names

  puts email_avernes

  hash_emails = Hash[town_names.zip(email_avernes)]

  return hash_emails

end

site = "http://annuaire-des-mairies.com/95/avernes.html"

get_townhall_email(site)

def get_townhall_list

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))

  town_urls = []

  town_names = []

  url = "http://annuaire-des-mairies.com/95/"
 
  page.xpath('/html/body/pre/a').each do |td|

  town_urls << url + td["href"]

  end

  return town_urls[5..-1] + town_names

end

get_townhall_list.each do |x| 
  get_townhall_email(x)

 end
