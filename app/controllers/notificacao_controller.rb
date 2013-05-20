# -*- encoding : utf-8 -*-
class NotificacaoController < ApplicationController
  
  def index
  end

  def exemplo
  end


  def buscar_notificacoes
    puts "ACCOUNT ID:   #{params[:account_id]}" 
    puts "TO:   #{params[:to]}" 
    puts "FROM: #{params[:from]}"

    @account_id = params[:account_id]
    @to = params[:to]
    @from = params[:from]

    identificadores_destinatarios = @to.split(',') rescue []
    destinatarios = []
    destinatarios << Destinatario.find_by_identificador( identificadores_destinatarios )
    puts "DESTINATARIOS: #{ destinatarios }"

    @notificacoes = Notificacao.buscar_notificacoes(destinatarios, @from)

    puts "TOTAL DE NOTIFICACOES #{ @notificacoes.count }"

    render :action => "notificacoes_carregadas", :formats => [:js]
  end

  def marcar_como_visualizado
    @account_id = params[:account_id]
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
    puts "ACCOUNT ID:   #{params[:account_id]}" 
    puts "TO:   #{params[:to]}" 
    puts "FROM: #{params[:from]}"

    @from = params[:from]
    @to = params[:to]
    @account_id = params[:account_id]

    identificadores_destinatarios = @to.split(',') rescue []

    destinatarios = []
    destinatarios << Destinatario.find_by_identificador( identificadores_destinatarios )
    @notificacoes = Notificacao.buscar_notificacoes(destinatarios, @from)

    render :show_notificacoes, :layout => false
  end


end
