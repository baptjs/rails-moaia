class CreateDiveTypeTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :dive_type_taggings do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :dive_type_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
