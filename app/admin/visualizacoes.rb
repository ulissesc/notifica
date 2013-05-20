# -*- encoding : utf-8 -*-
ActiveAdmin.register Visualizacao do
	menu :label => "Visualizações" 
	filter :data_hora 
	filter :visto_por    

	form do |f|                         
	    f.inputs "Visualizações" do       
	      f.input :notificacao                  
	      f.input :data_hora
	      f.input :visto_por               
	    end                               
	    f.actions                         
    end  
end
