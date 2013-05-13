# -*- encoding : utf-8 -*-
class CreateVisualizacoes < ActiveRecord::Migration
  def change
    create_table :visualizacoes do |t|
      t.timestamp :data_hora
      t.references :notificacao
      t.references :destinatario

      t.timestamps
    end
    add_index :visualizacoes, :notificacao_id
    add_index :visualizacoes, :destinatario_id
  end
end
