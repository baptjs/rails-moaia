class AddInitSpottingsToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :init_spottings, :text, array: true, default: []
  end
end
