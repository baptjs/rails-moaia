class AddRegionToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :region, :string
  end
end
