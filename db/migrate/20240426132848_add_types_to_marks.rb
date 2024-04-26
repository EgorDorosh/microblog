class AddTypesToMarks < ActiveRecord::Migration[6.1]
  def change
    add_column :marks, :mark_type, :string, null: false
  end
end
