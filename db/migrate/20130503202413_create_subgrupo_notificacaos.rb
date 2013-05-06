# -*- encoding : utf-8 -*-
class CreateSubgrupoNotificacaos < ActiveRecord::Migration
  def change
    create_table :subgrupo_notificacaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
