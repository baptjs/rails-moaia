class AddInitTagsToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :init_tags, :text, array: true, default: []
  end
end
