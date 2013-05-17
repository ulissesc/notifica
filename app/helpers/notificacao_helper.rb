# -*- encoding : utf-8 -*-
module NotificacaoHelper

def humanizando(notificacoes)
	if notificacoes.count == 0
		"nenhuma notificação"
	elsif notificacoes.count == 1
		"uma notificação"
	else
		"#{notificacoes.count} notificações"
	end
end

def plural(notificacoes)
	if notificacoes.count == 0
		"notificações"
	elsif notificacoes.count == 1
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
