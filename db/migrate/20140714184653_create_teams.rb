class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :code
      t.string :color1
      t.string :color2

      t.timestamps
    end
  end
end
