require 'rubygems'
require 'nokogiri'
require 'open-uri'


=begin
def get_the_dep_list
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
dep1 = []
list = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
page.xpath('//*[@id="deputes-list"]/div[1]/ul[1]/li[1]/a').each do |z|
dep1 << list + z["li"].to_s
end
return dep1[5..-1]
end

get_the_dep_list
=end



def dep_list
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@deputes_name = []
	page.xpath('//h2').each do |x|
		if x.to_s.include?('class="titre_normal"')
			@deputes_name << x.text.gsub('Mme ', '').gsub('M ', '')
		end
	end
	return @deputes_name
end

def dep_mail
	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	@dep_mail = []
	page.xpath('//a').each do |x|
		if x.to_s.include?("@assemblee-nationale.fr") && x.text.to_s.include?('secretariat-blanchet') == false
#&& x.text.to_s.include?(' sur_rendez-vous_par_email') == false
			@dep_mail << x.text
		end
	end
	return @dep_mail
end

nom = dep_list
email = dep_mail
z = 0
tab = []
dep_mail.each do
	tab << { "name" => nom[z], "email" => email[z] }
	z += 1
end

puts tab