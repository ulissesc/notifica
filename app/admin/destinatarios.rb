# -*- encoding : utf-8 -*-
ActiveAdmin.register Destinatario do
	menu :label => "Destinatários"    
	filter :descricao
	filter :identificador

	form do |f|
    	f.inputs do
    		f.input :descricao, :label => "Descrição"
    		f.input :identificador
    		f.input :notificacoes, :as => :check_boxes
    	end
    	f.actions
 	end

end
