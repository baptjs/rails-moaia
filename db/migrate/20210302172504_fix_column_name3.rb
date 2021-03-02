class FixColumnName3 < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :spotting_ids, :fish_ids
  end
end
