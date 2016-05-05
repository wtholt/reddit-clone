class AddTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string, after: :topic_id
  end
end
