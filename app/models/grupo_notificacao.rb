# -*- encoding : utf-8 -*-
class GrupoNotificacao < ActiveRecord::Base
  attr_accessible :descricao, :identificador
  belongs_to :account
  
  # validates :identificador, :uniqueness => true
  acts_as_tenant(:account)

  def name
  	"#{self.descricao} | #{self.identificador}"
  end

end
