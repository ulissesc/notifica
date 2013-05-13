# -*- encoding : utf-8 -*-
class CreateDestinatarios < ActiveRecord::Migration
  def change
    create_table :destinatarios do |t|
      t.string :descricao
      t.string :identificador

      t.timestamps
    end
  end
end
