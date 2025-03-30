class RemoveMicropostIdFromMarks < ActiveRecord::Migration[6.1]
  def change
    remove_column :marks, :micropost_id, :integer
  end
end
