# -*- encoding : utf-8 -*-
class AddVistoPorToVisualizacao < ActiveRecord::Migration
  def change
    add_column :visualizacoes, :visto_por, :string
  end
end
