# -*- encoding : utf-8 -*-
class NotificacaoController < ApplicationController
  
  def index
  end

  def exemplo
  end


  def buscar_notificacoes
    config_current_tenant

    @account_id = params[:account_key]
    @to = params[:to]
    @from = params[:from]

    puts "ACCOUNT KEY:   #{ @account_id }" 
    puts "TO:   #{ @to }" 
    puts "FROM: #{ @from }"


    identificadores_destinatarios = @to.split(',') rescue []
    identificadores_destinatarios.each { |e| e.strip! }

    puts "IDENTIFICADORES DESTINATARIOS: #{ identificadores_destinatarios }"

    destinatarios_encontrados = Destinatario.where( :identificador => identificadores_destinatarios )
    destinatarios = []
    destinatarios << destinatarios_encontrados if destinatarios_encontrados
    destinatarios.flatten!

    puts "DESTINATARIOS (BUSCA): #{ destinatarios }"

    @notificacoes = Notificacao.buscar_notificacoes(destinatarios, @from)

    puts "TOTAL DE NOTIFICACOES #{ @notificacoes.count }"

    render :action => "notificacoes_carregadas", :formats => [:js]
  end

  def marcar_como_visualizado
    config_current_tenant

    @account_id = params[:account_key]
    @notificacao_id = params[:notificacao]

    @notificacao = Notificacao.find(@notificacao_id)

    @visualizacao = Visualizacao.new 
    @visualizacao.visto_por = params[:from]
    @visualizacao.notificacao = @notificacao
    @visualizacao.account_id = @account_id
    @visualizacao.data_hora = Time.now
    
    if @visualizacao.save
      render :json => @visualizacao
    else
      render :text => "falha", :status => 403
    end
  end


  def mostrar_notificacoes
    config_current_tenant

    puts "ACCOUNT KEY:   #{params[:account_key]}" 
    puts "TO:   #{params[:to]}" 
    puts "FROM: #{params[:from]}"

    @from = params[:from]
    @to = params[:to]
    @account_id = params[:account_key]

    identificadores_destinatarios = @to.split(',') rescue []

    destinatarios = []
    destinatarios_encontrados = Destinatario.where( :identificador => identificadores_destinatarios )
    destinatarios << destinatarios_encontrados if destinatarios_encontrados
    destinatarios.flatten!
    @notificacoes = Notificacao.buscar_notificacoes(destinatarios, @from)

    puts "DESTINATARIOS (MOSTRAR): #{ destinatarios }"

    render :show_notificacoes, :layout => false
  end

  def config_current_tenant
    # BUSCA PELA CHAVE
    @current_account = Account.find_by_key(params[:account_key])
    # SE NAO ENCONTRAR, BUSCA PELO ID
    @current_account = Account.find(params[:account_key]) unless @current_account rescue nil

    puts "ACCOUNT CONFIGURADA: #{ @current_account.id rescue 'NENHUMA'} | PARAM @account_key: #{ params[:account_key] }"
    set_current_tenant(@current_account)
  end

end
