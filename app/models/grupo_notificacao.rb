# -*- encoding : utf-8 -*-
class GrupoNotificacao < ActiveRecord::Base
  attr_accessible :descricao

  def name
  	self.descricao
  end

end
