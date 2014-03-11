class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.references :chicken, index: true

      t.timestamps
    end
  end
end
