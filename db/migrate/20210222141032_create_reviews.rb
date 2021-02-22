class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.date :date
      t.text :content
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.text :tips

      t.timestamps
    end
  end
end
