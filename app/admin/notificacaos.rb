# encoding: utf-8

# -*- encoding : utf-8 -*-
ActiveAdmin.register Notificacao do
    menu :label => "Notificações"

    filter :titulo
    filter :grupo_notificacao
    filter :tipo, :as => :check_boxes, :collection => ["NORMAL", "MEDIA", "ALTA"]
    filter :conteudo

    scope :all
    scope :ativos
    scope :inativos


    member_action :fazer_copia_prox_mes, :method => :get do
      notificacao_origem = Notificacao.find(params[:id])

      norificacao_nova = notificacao_origem.dup
      norificacao_nova.titulo = norificacao_nova.titulo + " - cópia de #{notificacao_origem.id}"

      norificacao_nova.ativo_a_partir_de = norificacao_nova.ativo_a_partir_de + 1.month if norificacao_nova.ativo_a_partir_de
      norificacao_nova.ativo_ate = norificacao_nova.ativo_ate + 1.month if norificacao_nova.ativo_ate
      
      if norificacao_nova.save
            flash[:notice] = "Notificação duplicada com sucesso"
      else
            flash[:error] = "Falha ao duplicar notificacao"
      end

        redirect_to edit_admin_notificacao_path(norificacao_nova.id)
    end



    action_item :only => :show do
        link_to('Fazer uma cópia para próximo mês', fazer_copia_prox_mes_admin_notificacao_path)
    end

	form do |f|
    	f.inputs do
    		f.input :titulo, :label => "Título"
    		f.input :grupo_notificacao, :label => "Grupo da Notificação"
    		f.input :conteudo, as: :wysihtml5, :label => "Conteúdo"
            f.input :destinatarios, :as => :check_boxes
    		f.input :tipo, :as => :select, :collection => ["NORMAL", "MEDIA", "ALTA"]
    		f.input :manter_visivel
            f.input :contar_como_nao_lido, :label => "Contar sempre como não lido"            
            f.input :ativo_a_partir_de, :label => "Ativo a partir de", :as => :datepicker
            f.input :ativo_ate, :label => "Ativo até", :as => :datepicker
            f.input :created_at, :label => "Criado em"
    	end
    	f.actions
 	end

    index do
        title "OPA" 
        column("Título", :titulo)
        column("Grupo", :grupo_notificacao)
        column("Tipo", :tipo)
        column("Manter Visivel", :manter_visivel)
        column("Ativo a partir", :ativo_a_partir_de)
        column("Ativo até", :ativo_ate)
        default_actions
    end
  
end 
