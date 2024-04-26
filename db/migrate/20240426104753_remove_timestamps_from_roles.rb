class RemoveTimestampsFromRoles < ActiveRecord::Migration[6.1]
  def change
    def change
      remove_column :roles, :created_at
      remove_column :roles, :updated_at
    end
  end
end
