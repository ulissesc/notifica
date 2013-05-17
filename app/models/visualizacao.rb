# -*- encoding : utf-8 -*-
class Visualizacao < ActiveRecord::Base
  
  belongs_to :account
  acts_as_tenant(:account) #multi tenant

  belongs_to :notificacao
  belongs_to :destinatario
  attr_accessible :data_hora, :visto_por, :notificacao_id
end
