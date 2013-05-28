# -*- encoding : utf-8 -*-
ActiveAdmin.register Account do
  menu :if => proc{ current_admin_user.admin? }
  before_filter :current_user_admin?
end
