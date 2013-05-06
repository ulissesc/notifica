# -*- encoding : utf-8 -*-
class SubgrupoNotificacao < ActiveRecord::Base
  attr_accessible :descricao
  def name
  	self.descricao
  end
end
