class FixColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :spottings, :spotting_ids
  end
end
