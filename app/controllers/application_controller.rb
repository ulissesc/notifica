# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  set_current_tenant_through_filter
  before_filter :load_current_tenant

  def load_current_tenant
    current_account = current_admin_user.account rescue nil
    current_account = Account.find(params[:account_id]) if current_account.nil? rescue nil
    set_current_tenant(current_account)
  end

end
