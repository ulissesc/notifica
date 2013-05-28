class AddManterComoNaoVistoToNotificacao < ActiveRecord::Migration
  def change
    add_column :notificacaos, :contar_como_nao_lido, :boolean
  end
end
