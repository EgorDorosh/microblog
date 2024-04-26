class RemoveTimestampsFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :created_at
    remove_column :relationships, :updated_at
  end
end
