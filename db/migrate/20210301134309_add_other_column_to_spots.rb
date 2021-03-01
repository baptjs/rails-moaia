class AddOtherColumnToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :init_attractions_tags, :text, array: true, default: []
  end
end
