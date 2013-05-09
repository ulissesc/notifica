class NotificacaoController < ApplicationController
  
  def index
  	
  end



  def load_js

  puts "GRUPO #{params[:grupo]}" unless params[:grupo].nil?
  puts "SUBGRUPO #{params[:subgrupo]}"  unless params[:subgrupo].nil?

  query = Notificacao.joins(:grupo_notificacao, :subgrupo_notificacao)
  query = query.where("grupo_notificacaos.identificador = ?", params[:grupo] ) if params[:grupo]
  query = query.where("subgrupo_notificacaos.identificador = ?", params[:subgrupo]) if params[:subgrupo]
  query = query.sao_visiveis
  query.order("created_at DESC")

  @notificacoes = query.all

  puts "TOTAL DE NOTIFICACOES #{ @notificacoes.count }"

  render :action => "notificacoes_carregadas", :formats => [:js]

  end



  def show_notificacoes

  	@grupo = GrupoNotificacao.find_by_identificador( params[:grupo] )
  	@subgrupo = SubgrupoNotificacao.find_by_identificador( params[:subgrupo] ) if params[:subgrupo]

    puts "GRUPO #{@grupo.identificador}" unless @grupo.nil?
    puts "SUBGRUPO #{@subgrupo.identificador}"  unless @subgrupo.nil?
    
    
    query = Notificacao.joins(:grupo_notificacao, :subgrupo_notificacao)
    query = query.where("grupo_notificacaos.identificador = ?", @grupo.identificador) unless @grupo.nil?
    query = query.where("subgrupo_notificacaos.identificador = ?", @subgrupo.identificador)  unless @subgrupo.nil?
    query = query.sao_visiveis
    query.order("created_at DESC")
    

    @notificacoes = query.all

  	render :layout => false
  end


  def visualizado

   	@notificacao = Notificacao.find(params[:id])
   	@notificacao.data_visualizacao = Time.now
   	
   	if @notificacao.save
   		render :json => @notificacao
   	else
   		render :text => "falha", :status => 403
   	end

   end

end
