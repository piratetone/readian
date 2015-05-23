class AddPoliticalPointsToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :political_points, :integer
  end
end
