class RemoveLastNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :lastName, :string
  end
end
