class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.belongs_to :user, index: true
      t.integer :week
      t.integer :hits
      t.integer :tip1
      t.integer :tip2
      t.integer :tip3
      t.integer :tip4
      t.integer :tip5
      t.integer :tip6
      t.integer :tip7
      t.integer :tip8
      t.integer :tip9
      t.integer :tip10
      t.integer :tip11
      t.integer :tip12
      t.integer :tip13
      t.integer :tip14
      t.integer :tip15

      t.timestamps
    end
  end
end
