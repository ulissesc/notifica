class ChangeColumnToDateNotificacao < ActiveRecord::Migration
  def change
  	change_column :notificacaos, :ativo_ate, :date
  	change_column :notificacaos, :ativo_a_partir_de, :date
  end
end
