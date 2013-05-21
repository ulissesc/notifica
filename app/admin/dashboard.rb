# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 2, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Account" do
          ul do
            li h3 "Seu AccountKey é '#{ current_admin_user.account.key rescue 'ERRO: sem AccontKey' }'"
            li code "<div id='notification_bar'></div>" 
            li code "<script src='#{request.protocol + request.host_with_port}/notifica/#{ current_admin_user.account.key rescue '{ERRO: sem AccontKey}' }/{destinatarios}/{usuário origem}' ></script>" 
          end
           ul do  
              li p "Dados da conta: '#{ current_admin_user.account.label rescue 'ERRO: sem account' }'"
              li p "Dados da conta: '#{ current_admin_user.account.id rescue 'ERRO: sem account' }'"
          end
        end
      end
    end

    columns do
      column do
        panel "Últimas notificações visualizadas" do
           ul do
            Visualizacao.all.map do |record|
              li "Notificado '#{record.visto_por}' sobre '#{record.notificacao.titulo rescue nil}' -  #{ I18n.l record.data_hora}"
            end
          end
        end
      end
    end

  end # content
end
