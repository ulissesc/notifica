# -*- encoding : utf-8 -*-
class AddAccountToElements < ActiveRecord::Migration
  def change

  	Account.create(:label => "CONTEXTO TESTE")
  	
  	Destinatario.update_all(:account_id => Account.first.id)
  	Notificacao.update_all(:account_id => Account.first.id)
	Visualizacao.update_all(:account_id => Account.first.id)
  	GrupoNotificacao.update_all(:account_id => Account.first.id)
  	AdminUser.update_all(:account_id => Account.first.id)
  end
end
