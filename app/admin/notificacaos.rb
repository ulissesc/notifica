# -*- encoding : utf-8 -*-
ActiveAdmin.register Notificacao do
    menu :label => "Notificações"

    scope :all, :default => true
    # scope :nao_visualizados
    # scope :visualizados
	

	form do |f|
    	f.inputs do
    		f.input :titulo
    		f.input :grupo_notificacao
    		f.input :conteudo
            f.input :destinatarios, :as => :check_boxes
    		# f.input :data_visualizacao
    		f.input :tipo, :as => :select, :collection => ["NORMAL", "MÉDIA", "ALTA"]
    		f.input :manter_visivel 
    	end
    	f.actions
 	end

    index do
        column("Título", :titulo)
        column("Grupo", :grupo_notificacao)
        # column("Data/Hora Visualização", :data_visualizacao)
        column("Tipo", :tipo)
        default_actions
    end
  
end
