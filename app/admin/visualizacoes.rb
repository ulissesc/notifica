# -*- encoding : utf-8 -*-
ActiveAdmin.register Visualizacao do
	menu :label => "Visualizações"  

	form do |f|                         
	    f.inputs "Visualizações" do       
	      f.input :notificacao                  
	      f.input :data_hora
	      f.input :visto_por               
	    end                               
	    f.actions                         
    end  
end
