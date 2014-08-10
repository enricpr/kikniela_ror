class CreateBets < ActiveRecord::Migration
  def change	
    create_table :bets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.integer :week
      t.integer :hit
      t.string :tip

      t.timestamps
    end
  end
end
