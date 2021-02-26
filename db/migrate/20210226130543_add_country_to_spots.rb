class AddCountryToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :country, :string
  end
end
