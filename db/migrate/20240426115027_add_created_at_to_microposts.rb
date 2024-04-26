class AddCreatedAtToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :created_at, :datetime, null: false
  end
end
