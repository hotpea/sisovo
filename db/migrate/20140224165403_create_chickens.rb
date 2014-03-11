class CreateChickens < ActiveRecord::Migration
  def change
    create_table :chickens do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
