# -*- encoding : utf-8 -*-
module NotificacaoHelper

def humanizando(notificacoes)
	count = contar_notificacoes(notificacoes)

	if count == 0
		"nenhuma notificação"
	elsif count == 1
		"uma notificação"
	else
		"#{count} notificações"
	end
end

def contar_notificacoes(notificacoes)
	count = 0
	notificacoes.each do |notificacao|
		data_visualizado = notificacao.data_visualizado_por( @from )
		if data_visualizado 
			puts ">>> VISUALIZADO #{notificacao}"
			count = count + 1 if notificacao.contar_como_nao_lido
		else
			puts ">>> CONTOU #{notificacao}"
			count = count + 1
		end
	end 
	count
end

def plural(notificacoes)
	count = contar_notificacoes(notificacoes)

	if count == 0
		"notificações"
	elsif count == 1
		"notificação"
	else
		"notificações"
	end
end

def class_por_tipo(notificacao)
	if notificacao.tipo == "ALTA"
		"tipo-alto"
	elsif notificacao.tipo == "MEDIA"
		"tipo-medio"
	else
		"tipo-normal"
	end
end

end
