class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.references :region, index: true
      t.references :neighbour, index: true
      t.string :street
      t.string :address
      t.references :activity, index: true
      t.text :brief_of_activity
      t.string :day_off
      t.boolean :twenty_four
      t.string :word1
      t.string :word2
      t.string :word3
      t.string :word4
      t.string :word5
      t.string :tel1
      t.string :tel2
      t.string :tel3
      t.string :email
      t.time :start
      t.time :end
      t.string :website1
      t.string :website2
      t.boolean :can_announce

      t.timestamps null: false
    end
    add_foreign_key :agents, :regions
    add_foreign_key :agents, :neighbours
    add_foreign_key :agents, :activities
  end
end
