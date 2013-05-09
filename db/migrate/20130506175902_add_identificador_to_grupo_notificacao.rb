class AddIdentificadorToGrupoNotificacao < ActiveRecord::Migration
  def change
    add_column :grupo_notificacaos, :identificador, :string
  end
end
