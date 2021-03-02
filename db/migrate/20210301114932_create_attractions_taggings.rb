class CreateAttractionsTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions_taggings do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :attractions_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
