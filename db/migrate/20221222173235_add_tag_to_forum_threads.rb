class AddTagToForumThreads < ActiveRecord::Migration[7.0]
  def change
    add_column :forum_threads, :tag, :string
  end
end
