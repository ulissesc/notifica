class NotificacaoController < ApplicationController
  
  def index
  	
  end



  def load_js

  puts "GRUPO #{params[:grupo]}" unless params[:grupo].nil?
  puts "DESTINATARIO #{params[:destinatario]}"  unless params[:destinatario].nil?

  @notificacoes = Notificacao.buscar_notificacoes_para(params[:grupo], params[:destinatario])

  puts "TOTAL DE NOTIFICACOES #{ @notificacoes.count }"

  render :action => "notificacoes_carregadas", :formats => [:js]

  end



  def show_notificacoes
    puts "GRUPO #{params[:grupo]}" unless params[:grupo].nil?
    puts "DESTINATARIO #{params[:destinatario]}"  unless params[:destinatario].nil?

    @notificacoes = Notificacao.buscar_notificacoes_para(params[:grupo], params[:destinatario])

  	render :layout => false
  end




  def visualizado

   	@notificacao = Notificacao.find(params[:notificacao])
    @destinatario = Destinatario.find_by_identificador(params[:destinatario])

    @visualizacao = Visualizacao.new 
    @visualizacao.notificacao = @notificacao
    @visualizacao.destinatario = @destinatario
   	@visualizacao.data_hora = Time.now
   	
   	if @visualizacao.save
   		render :json => @visualizacao
   	else
   		render :text => "falha", :status => 403
   	end

   end

end
