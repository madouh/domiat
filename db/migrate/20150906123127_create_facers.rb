class CreateFacers < ActiveRecord::Migration
  def change
    create_table :facers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :image
      t.datetime :oauth_expires_at
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
