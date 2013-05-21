# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  set_current_tenant_through_filter
  before_filter :load_current_tenant

  def load_current_tenant
    current_account = current_admin_user.account rescue nil
    puts "CURRENT ACCOUNT: #{ current_account.id rescue 'sem id'} / #{ current_account.key rescue 'sem key'}"
    set_current_tenant(current_account)
  end

end
