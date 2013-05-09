# -*- encoding : utf-8 -*-
class GrupoNotificacao < ActiveRecord::Base
  attr_accessible :descricao, :identificador

  validates :identificador, :uniqueness => true

  def name
  	"#{self.descricao} | #{self.identificador}"
  end

end
