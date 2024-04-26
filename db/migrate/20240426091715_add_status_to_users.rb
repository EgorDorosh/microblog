class AddStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :status, null: false, foreign_key: true, default: 1
  end
end
