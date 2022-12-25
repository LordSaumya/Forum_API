class RemoveSaltFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :salt, :string
  end
end
