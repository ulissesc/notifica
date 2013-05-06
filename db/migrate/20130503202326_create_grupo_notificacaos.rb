# -*- encoding : utf-8 -*-
class CreateGrupoNotificacaos < ActiveRecord::Migration
  def change
    create_table :grupo_notificacaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
