# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 2, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Account" do
          br 
          h3 "Seu AccountKey é " do
            b "'#{ current_admin_user.account.key rescue 'ERRO: sem AccontKey' }'"
          end        
          h5 "Dados da conta:"
          ul do  
              li p "Conta: '#{ current_admin_user.account.label rescue 'ERRO: sem account' }'"
              li p "Conta ID: '#{ current_admin_user.account.id rescue 'ERRO: sem account' }'"
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
