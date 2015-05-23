class CreateNeighbours < ActiveRecord::Migration
  def change
    create_table :neighbours do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
