class RemoveTimestampsFromMicroposts < ActiveRecord::Migration[6.1]
  def change
    remove_column :microposts, :updated_at
  end
end
