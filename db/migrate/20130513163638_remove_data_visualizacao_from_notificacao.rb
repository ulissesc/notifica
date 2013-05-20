# -*- encoding : utf-8 -*-
class RemoveDataVisualizacaoFromNotificacao < ActiveRecord::Migration
  def change
  	remove_column :notificacaos, :data_visualizacao
  end
end
