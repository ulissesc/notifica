# -*- encoding : utf-8 -*-
ActiveAdmin.register GrupoNotificacao do
  menu :label => "Grupo de Notificação"

  form do |f|                         
    f.inputs "Grupo de Notificações" do       
      f.input :descricao                  
      f.input :identificador               
    end                               
    f.actions                         
  end  
end
