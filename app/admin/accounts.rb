ActiveAdmin.register Account do
  menu :if => proc{ current_admin_user.admin? }
end
