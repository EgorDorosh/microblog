class RemoveUpdatedAtFromHashtagSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :hashtag_subscriptions, :updated_at, :datetime
  end
end
