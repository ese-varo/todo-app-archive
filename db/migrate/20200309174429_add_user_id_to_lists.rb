class AddUserIdToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :user, foreign_key: true
  end
end
