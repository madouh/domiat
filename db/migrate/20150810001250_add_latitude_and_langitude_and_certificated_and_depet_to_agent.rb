class AddLatitudeAndLangitudeAndCertificatedAndDepetToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :latitude, :float
    add_column :agents, :langitude, :float
    add_column :agents, :certificated, :boolean
    add_column :agents, :depet, :float
  end
end
