class RemoveForumThreadsIdForeignKeyFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, column: :ForumThread_id
    add_foreign_key :comments, :forum_threads, column: :ForumThread_id
  end
end
