class AddColumnToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :init_difficulty_tags, :text, array: true, default: []
  end
end
