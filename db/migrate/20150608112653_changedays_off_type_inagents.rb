class ChangedaysOffTypeInagents < ActiveRecord::Migration
  def change
    change_column :agents, :day_off, "varchar[] USING (string_to_array(day_off, ','))"

  end
end
