class CreateForumThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :forum_threads do |t|
      t.references :User, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
