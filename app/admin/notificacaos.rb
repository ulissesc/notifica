# -*- encoding : utf-8 -*-
ActiveAdmin.register Notificacao do
    menu :label => "Notificações"
    filter :titulo
    filter :grupo_notificacao
    filter :tipo, :as => :check_boxes, :collection => ["NORMAL", "MEDIA", "ALTA"]
    filter :conteudo

    scope :all

	form do |f|
    	f.inputs do
    		f.input :titulo
    		f.input :grupo_notificacao
    		f.input :conteudo
            f.input :destinatarios, :as => :check_boxes
    		f.input :tipo, :as => :select, :collection => ["NORMAL", "MEDIA", "ALTA"]
    		f.input :manter_visivel 
    	end
    	f.actions
 	end

    index do
        column("Título", :titulo)
        column("Grupo", :grupo_notificacao)
        column("Tipo", :tipo)
        default_actions
    end
  
end
