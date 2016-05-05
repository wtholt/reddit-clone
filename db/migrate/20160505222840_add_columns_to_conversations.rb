class AddColumnsToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :topic_id, :integer
    add_column :conversations, :user_id, :integer
  end
end
