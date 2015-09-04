class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :cause
      t.string :tel
      t.text :comment

      t.timestamps null: false
    end
  end
end
