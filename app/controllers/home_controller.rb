# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
  	@novo_usuario = AdminUser.new
  end


  def criar_novo_usuario
  	@novo_usuario = AdminUser.new(params[:admin_user])
  	puts ">>>>>>>>> #{@novo_usuario.valid?}"
  	if @novo_usuario.valid?
  		@novo_usuario.account = Account.create(:label => @novo_usuario.email)
  		@novo_usuario.save
  		@admin_user = @novo_usuario
  		flash[:notice] = "Usuário '#{@novo_usuario.email}' criado"
  		render "criar_novo_usuario", :formats => [:js]
  	else
  		render "criar_novo_usuario", :formats => [:js]
  	end
  	
  end

end
