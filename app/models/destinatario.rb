# -*- encoding : utf-8 -*-
class Destinatario < ActiveRecord::Base
  has_and_belongs_to_many :notificacoes, :join_table => "notificacoes_destinatarios", :class_name => "Notificacao"
  attr_accessible :descricao, :identificador, :notificaco_ids
  belongs_to :account
  acts_as_tenant(:account)

  validates :identificador, :uniqueness => true

  def display_name
  	"#{self.descricao} - #{self.identificador}"
  end
end
