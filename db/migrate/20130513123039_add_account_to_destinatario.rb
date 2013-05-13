# -*- encoding : utf-8 -*-
class AddAccountToDestinatario < ActiveRecord::Migration
  def change
  	add_column :destinatarios, :account_id, :integer
  end
end
