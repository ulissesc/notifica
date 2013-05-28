# encoding: utf-8

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
    		f.input :titulo, :label => "Título"
    		f.input :grupo_notificacao, :label => "Grupo da Notificação"
    		f.input :conteudo, as: :wysihtml5, :label => "Conteúdo"
            f.input :destinatarios, :as => :check_boxes
    		f.input :tipo, :as => :select, :collection => ["NORMAL", "MEDIA", "ALTA"]
    		f.input :manter_visivel
            f.input :contar_como_nao_lido, :label => "Contar sempre como não lido"
            f.input :ativo_ate, :label => "Ativo até"
    	end
    	f.actions
 	end

    index do
        column("Título", :titulo)
        column("Grupo", :grupo_notificacao)
        column("Tipo", :tipo)
        column("Manter Visivel", :manter_visivel)
        column("Ativo até", :ativo_ate)
        default_actions
    end
  
end 
