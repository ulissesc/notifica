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

end
