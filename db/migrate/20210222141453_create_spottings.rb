class CreateSpottings < ActiveRecord::Migration[6.0]
  def change
    create_table :spottings do |t|
      t.references :fish, null: false, foreign_key: true
      t.string :number
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
