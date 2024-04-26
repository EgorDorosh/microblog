class RemoveTimestampsFromMicroposts < ActiveRecord::Migration[6.1]
  def change
    def change
      remove_column :relationships, :updated_at
    end
  end
end
