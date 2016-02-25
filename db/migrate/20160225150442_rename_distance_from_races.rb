class RenameDistanceFromRaces < ActiveRecord::Migration
  def change
    rename_column :races, :distance, :race_distance
  end
end
