require 'nokogiri'
require 'open-uri'
class Pega_personagem
	attr_accessor :nomes
	
	def initialize
		@nomes = []
	end
	def print
		@teste
		for i in 0..@nomes.length-1
			@teste = @nomes[i].to_s
			puts @teste.gsub(/ /,'_')
		end
	end
	def add
		# Fetch and parse HTML document
		doc = Nokogiri::HTML(URI.open(''))

		# Search for nodes by css
		doc.css('li').css('a').each do |link|
				final = link.content.index(/,/)
				
				if final
					@nomes.append(link.content[0,final])
				else
					@nomes.append(link.content)
				end
		end
	end
end


class Pega_historia
	attr_accessor :historia
	def initialize
		@historia = []
	end
	def print(nomes)
		for i in 0..@historia.length
			nomes = nomes[i].upcase
			puts nomes
			puts "\n"
			puts @historia[i]
			puts "\n\n\n"
		end
	end
	def add(nomes)		
		for i in 0..nomes.length
			@teste
			# Fetch and parse HTML document
			#@teste = str.sub(/\s/, "xxx")
			@teste = nomes[i].to_s
			@teste = @teste.gsub(/ /,'_')
			@link = "/#{@teste}"
			puts @link
			doc = Nokogiri::HTML(URI.open(@link))

			# Search for nodes by css
			
			@historia.append(doc.css('p')[3].text)
		end
	end
	
	
end
p_nome = Pega_personagem.new

p_nome.add
p_nome.print

p_historia = Pega_historia.new

p_historia.add(p_nome.nomes)
p_historia.print(p_nome.nomes)