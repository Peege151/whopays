class AddUserIdToPool < ActiveRecord::Migration
  def change
    add_column :pools, :user_id, :integer
  end
end
