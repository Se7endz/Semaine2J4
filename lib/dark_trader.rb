require 'rubygems'
require 'nokogiri'
require 'open-uri'


def cours_crypto 
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	@val = []
	@name = []
	page.xpath('//a').each do |x|
		if x.to_s.include?('class="currency-name-container link-secondary"')
			@name << x.text
  		elsif x.to_s.include?('class="price"')
			@val << x.text
		end	
	end
	return @prix, @nom
end

p cours_crypto
seven = Hash[@name.zip(@val)]
puts seven

