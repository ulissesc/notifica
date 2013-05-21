# -*- encoding : utf-8 -*-
class AdminUser < ActiveRecord::Base

  ADMIN = "ADMIN"
  USER = "USER"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  validates :account, :presence => true
  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_type, :account_id
  # attr_accessible :title, :body

  def admin?
  	self.user_type == ADMIN
  end
  
end
