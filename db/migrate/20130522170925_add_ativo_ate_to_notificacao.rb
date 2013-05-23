class AddAtivoAteToNotificacao < ActiveRecord::Migration
  def change
    add_column :notificacaos, :ativo_ate, :timestamp
  end
end
