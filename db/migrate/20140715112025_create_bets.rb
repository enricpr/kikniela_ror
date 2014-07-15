class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :tip
      t.boolean :hit
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
	add_index :bets, [:user_id, :game_id]
  end
end
