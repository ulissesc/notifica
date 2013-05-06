class ChangeDataTypeNotificacaoDataNotificacao < ActiveRecord::Migration
  def up
  	change_table :notificacaos do |t|
      t.change :data_visualizacao, :timestamp
    end
  end

  def down
  	change_table :notificacaos do |t|
      t.change :data_visualizacao, :date
    end
  end
end
