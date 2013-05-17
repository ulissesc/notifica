# -*- encoding : utf-8 -*-
ActiveAdmin.register AdminUser do     
  menu :label => "Usuários" 
  menu :if => proc{ current_admin_user.admin? }

  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation
      f.input :user_type, :as => :select, :collection => ["ADMIN", "USER"] if current_admin_user.admin?
      f.input :account if current_admin_user.admin? 
    end                               
    f.actions                         
  end                                 
end                                   
