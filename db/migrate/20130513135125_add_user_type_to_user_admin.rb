# -*- encoding : utf-8 -*-
class AddUserTypeToUserAdmin < ActiveRecord::Migration
  def change
  	add_column :admin_users, :user_type, :string
  end
end
