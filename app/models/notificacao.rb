# -*- encoding : utf-8 -*-
class Notificacao < ActiveRecord::Base

  # MULTI TENANT
  belongs_to :account
  acts_as_tenant(:account)

  belongs_to :grupo_notificacao
  has_and_belongs_to_many :destinatarios, :join_table => "notificacoes_destinatarios", :class_name => "Destinatario"
  has_many :visualizacoes, :dependent => :destroy

  attr_accessible :conteudo, :manter_visivel, :tipo, :titulo, :grupo_notificacao_id, :destinatario_ids, :ativo_ate

  def display_name
  	self.titulo
  end


  def self.buscar_notificacoes(destinatarios, from)

    query = Notificacao.joins(:destinatarios)
    
    query = query.where("ativo_ate is null or ativo_ate < ?", Time.now)
    query = query.where("destinatarios.identificador in ( ? )", destinatarios.map(&:identificador))
    query.order("notificacaos.created_at DESC")

    notificacoes = []
    query.all.each do |notificacao|
      if notificacao.manter_visivel
        notificacoes << notificacao
      else
        if notificacao.visualizacoes.where(:visto_por => from).empty?
          notificacoes << notificacao
        end
      end
    end

    notificacoes
  end


  def visualizacoes_destinatario(destinatario_identificador)
    data_hora = nil
    self.visualizacoes.each do |visualizacao|
      if visualizacao.destinatario.identificador == destinatario_identificador
       data_hora = visualizacao.data_hora
      end
    end
    data_hora
  end


  def data_visualizado_por(from)
    data_hora = nil
    self.visualizacoes.each do |visualizacao|
      if visualizacao.visto_por == from
       data_hora = visualizacao.data_hora
      end
    end
    data_hora
  end

end
