class AddAccountToGrupoNotificacao < ActiveRecord::Migration
  def change
  	add_column :grupo_notificacaos, :account_id, :integer
  end
end
