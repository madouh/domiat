class AddOkToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :ok, :boolean
  end
end
