# -*- encoding : utf-8 -*-
class Notificacao < ActiveRecord::Base

  scope	:visualizados, where("notificacaos.data_visualizacao IS NOT NULL")
  scope	:nao_visualizados, where("notificacaos.data_visualizacao IS NULL")
  scope	:sao_visiveis, where(" (notificacaos.data_visualizacao IS NULL or notificacaos.manter_visivel) ")

  belongs_to :grupo_notificacao
  belongs_to :subgrupo_notificacao
  attr_accessible :conteudo, :data_visualizacao, :manter_visivel, :tipo, :titulo, :grupo_notificacao_id,  :subgrupo_notificacao_id

  def display_name
  	self.titulo
  end

end
