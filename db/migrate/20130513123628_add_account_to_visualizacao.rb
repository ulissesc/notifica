# -*- encoding : utf-8 -*-
class AddAccountToVisualizacao < ActiveRecord::Migration
  def change
  	add_column :visualizacoes, :account_id, :integer
  end
end
