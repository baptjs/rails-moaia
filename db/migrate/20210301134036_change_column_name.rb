class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :spots, :init_tags, :init_dive_type_tags
  end
end
