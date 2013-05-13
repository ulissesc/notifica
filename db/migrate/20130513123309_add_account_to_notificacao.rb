class AddAccountToNotificacao < ActiveRecord::Migration
  def change
  	add_column :notificacaos, :account_id, :integer
  end
end
