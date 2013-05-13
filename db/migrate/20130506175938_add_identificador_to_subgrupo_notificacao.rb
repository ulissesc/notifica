# -*- encoding : utf-8 -*-
class AddIdentificadorToSubgrupoNotificacao < ActiveRecord::Migration
  def change
    add_column :subgrupo_notificacaos, :identificador, :string
  end
end
