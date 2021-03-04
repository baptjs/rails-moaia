class AddPeopleToConversation < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :people, :integer, array: true, default: []
  end
end
