# -*- encoding : utf-8 -*-
class CreateNotificacaos < ActiveRecord::Migration
  def change
    create_table :notificacaos do |t|
      t.string :titulo
      t.text :conteudo
      t.references :grupo_notificacao
      t.references :subgrupo_notificacao
      t.string :tipo
      t.date :data_visualizacao
      t.boolean :manter_visivel

      t.timestamps
    end
    add_index :notificacaos, :grupo_notificacao_id
    add_index :notificacaos, :subgrupo_notificacao_id
  end
end
