class ChangePoliticalPointsToLinks < ActiveRecord::Migration
  def change
  	change_column :links, :political_points, :float, :default => 0.0
  end
end
