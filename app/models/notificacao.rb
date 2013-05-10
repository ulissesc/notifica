# -*- encoding : utf-8 -*-
class Notificacao < ActiveRecord::Base

  scope	:visualizados, where("notificacaos.data_visualizacao IS NOT NULL")
  scope	:nao_visualizados, where("notificacaos.data_visualizacao IS NULL")
  scope	:sao_visiveis, where(" (notificacaos.data_visualizacao IS NULL or notificacaos.manter_visivel) ")

  belongs_to :grupo_notificacao
  belongs_to :subgrupo_notificacao
  has_and_belongs_to_many :destinatarios, :join_table => "notificacoes_destinatarios", :class_name => "Destinatario"
  has_many :visualizacoes

  attr_accessible :conteudo, :data_visualizacao, :manter_visivel, :tipo, :titulo, 
  	:grupo_notificacao_id,  :subgrupo_notificacao_id, :destinatario_ids

  def display_name
  	self.titulo
  end


  def self.buscar_notificacoes_para(identificador_grupo_notificacao, identificador_destinatario=nil)
    query = Notificacao.joins(:grupo_notificacao, :destinatarios)
    query = query.where("grupo_notificacaos.identificador = ?", identificador_grupo_notificacao)
    query = query.where("destinatarios.identificador = ?", identificador_destinatario) if identificador_destinatario
    query = query.sao_visiveis
    query.order("created_at DESC")
  end

end
