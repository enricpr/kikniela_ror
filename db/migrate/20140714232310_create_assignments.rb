class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :game, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end
