# -*- encoding : utf-8 -*-
ActiveAdmin.register GrupoNotificacao do
  menu :label => "Grupo de Notificação"
  filter :descricao 
  filter :identificador

  form do |f|                         
    f.inputs "Grupo de Notificações" do       
      f.input :descricao                  
    end                               
    f.actions                         
  end  
end
