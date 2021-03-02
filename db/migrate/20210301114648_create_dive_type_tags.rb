class CreateDiveTypeTags < ActiveRecord::Migration[6.0]
  def change
    create_table :dive_type_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
