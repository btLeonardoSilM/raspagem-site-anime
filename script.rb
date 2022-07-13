=begin
	
Script de teste para pegar os ultímos vídeos adcionados
	
=end
require 'open-uri'
require 'nokogiri'

html = URI.open("") # aqui vai o link
doc = Nokogiri::HTML(html)

$texto = "" # pega o nome do vídeo
$cont = 0 # verifica se já pegou todos os conteúdos
$teste = true # inicia de novo o precesso de procurar novos vídeos
$i = 0 # auxilia na contagem de caracteres 

def pega_tempo() # pra teste
	t = Time.now
	puts t.strftime("%H:%M:%S")
end


def procura()
	while $teste == true
			# todo vídeo termina com o número do ep(ex: dragon ball - ep 01), esse if serve pra separar cada vídeo
			if Integer($description[$i], exception: false)
				if Integer($description[$i+1], exception: false)
					$texto += $description[$i].to_s+$description[$i+1]+ "  " # a maioria do vídeos não passa da qtd de 2 digitos, por enquanto essa verificação serve
					puts $texto
					
					$texto = "" #Resseta quando acha o número do vídeo
				end
			else
				$texto += $description[$i].to_s
			end

			$i += 1
			if $texto == ""
				$cont += 1
				if $cont == 3
					puts 'acabou'
					$cont = 0;
					$i = 0;
					$teste = false

				end
			else $cont = 0
			end
		
	end
end


while true
	$description = doc.css("").text # coloca o nome da classe ou id
	$description = doc.css("").text.strip.split("\n")[0] # coloca o nome da classe ou id
	procura()
	puts "---------------------------------------------------------------------"
	$teste = true
	sleep 300	
end