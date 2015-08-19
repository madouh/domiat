class AddUserRefToAgents < ActiveRecord::Migration
  def change
    add_reference :agents, :user, index: true
    add_foreign_key :agents, :users
  end
end
