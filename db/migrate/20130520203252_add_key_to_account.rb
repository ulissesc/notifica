class AddKeyToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :key, :string
  end
end
