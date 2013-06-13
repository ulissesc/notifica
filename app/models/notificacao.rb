# -*- encoding : utf-8 -*-
class Notificacao < ActiveRecord::Base

  scope :ativos, where("(ativo_ate >= ? or ativo_ate is null) and (ativo_a_partir_de <= ? or ativo_a_partir_de is null)", Time.zone.today, Time.zone.today )
  scope :inativos, where("ativo_ate < ? or ativo_a_partir_de > ? ", Time.zone.today, Time.zone.today )
  scope :serao_ativados, where("ativo_ate > ? and ativo_a_partir_de > ? ", Time.zone.today, Time.zone.today )

  # MULTI TENANT
  belongs_to :account
  acts_as_tenant(:account)

  belongs_to :grupo_notificacao
  has_and_belongs_to_many :destinatarios, :join_table => "notificacoes_destinatarios", :class_name => "Destinatario"
  has_many :visualizacoes, :dependent => :destroy

  attr_accessible :conteudo, :manter_visivel, :tipo, :titulo, :grupo_notificacao_id, 
    :destinatario_ids, :ativo_ate, :contar_como_nao_lido, :ativo_a_partir_de, :created_at

  def display_name
  	self.titulo
  end

  def self.buscar_notificacoes(destinatarios, from)

    puts "BUSCAR NOTIFICACOES P/ OS SEG DEST: #{destinatarios.inspect}"
    query = Notificacao.joins(:destinatarios)
    
    query = query.ativos 
    # = query.where("ativo_ate is null or ativo_ate < ?", Time.zone.now )
    # query = query.where("ativo_a_partir_de is null or ativo_ate > ?", Time.zone.now )
    query = query.where("destinatarios.identificador in ( ? )", destinatarios.map(&:identificador))
    query.order("notificacaos.created_at DESC")

    puts "WHERE VALUES: #{query.where_values}"
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
    # Numero máximo de 10 notificações
    notificacoes[0..10]
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
