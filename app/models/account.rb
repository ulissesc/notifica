# -*- encoding : utf-8 -*-
class Account < ActiveRecord::Base
  attr_accessible :label, :key
  validates :key, :uniqueness => true

  def display_name
  	"#{self.id} - #{self.label}"
  end
end
