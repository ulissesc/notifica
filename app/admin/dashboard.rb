# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 2, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "AccountID" do
           ul do
              li h4 "Seu AccountID é '#{ current_admin_user.account.id rescue 'ERRO: sem AccontID' }'"
          end
        end
      end
    end

    columns do
      column do
        panel "Últimas notificações visualizadas" do
           ul do
            Visualizacao.all.map do |record|
              li "Notificado '#{record.visto_por}' sobre '#{record.notificacao.titulo rescue nil}' às #{record.data_hora}"
            end
          end
        end
      end
    end

  end # content
end
