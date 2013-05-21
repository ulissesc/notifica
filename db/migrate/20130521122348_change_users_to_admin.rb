class ChangeUsersToAdmin < ActiveRecord::Migration
  def change
  	AdminUser.update_all(:user_type => "ADMIN")
  end
end
