class CreateGames < ActiveRecord::Migration
  def change		
    create_table :games do |t|
      t.string :team1
      t.string :team2
      t.string :result
      t.integer :week

      t.timestamps
    end
  end
end
