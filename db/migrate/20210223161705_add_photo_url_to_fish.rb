class AddPhotoUrlToFish < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :photo_url, :string
  end
end
