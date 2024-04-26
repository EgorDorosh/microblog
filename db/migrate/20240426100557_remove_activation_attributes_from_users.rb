class RemoveActivationAttributesFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :activated
    remove_column :users, :activated_at
  end
end
