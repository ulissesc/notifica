class AddAtivoAPartirDeToNotificacao < ActiveRecord::Migration
  def change
    add_column :notificacaos, :ativo_a_partir_de, :timestamp
  end
end
