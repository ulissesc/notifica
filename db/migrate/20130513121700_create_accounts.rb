# -*- encoding : utf-8 -*-
class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :label

      t.timestamps
    end
  end
end
