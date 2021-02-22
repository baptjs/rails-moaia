class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.float :latitude
      t.float :longitude
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
