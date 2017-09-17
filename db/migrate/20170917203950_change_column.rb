class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, unique: true
  end
end
