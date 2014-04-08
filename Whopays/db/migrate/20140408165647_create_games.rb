class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :pool_id
      t.integer :user_id

      t.timestamps
    end
    add_index :games, [:pool_id, :user_id], unique: true

  end
end
