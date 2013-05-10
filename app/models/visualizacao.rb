class Visualizacao < ActiveRecord::Base
  belongs_to :notificacao
  belongs_to :destinatario
  attr_accessible :data_hora
end
