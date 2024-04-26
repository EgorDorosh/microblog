class RemoveTimestampsFromStatuses < ActiveRecord::Migration[6.1]
  def change
    def change
      remove_column :statuses, :created_at
      remove_column :statuses, :updated_at
    end
  end
end
