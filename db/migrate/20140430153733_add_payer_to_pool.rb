class AddPayerToPool < ActiveRecord::Migration
  def change
  	add_column :pools, :payer, :integer
  end
end
