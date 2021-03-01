class CreateAttractionsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
