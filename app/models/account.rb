class Account < ActiveRecord::Base
  attr_accessible :label

  def display_name
  	"#{self.id} - #{self.label}"
  end
end
