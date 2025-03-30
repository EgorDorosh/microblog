class AddPolymorphicToMarks < ActiveRecord::Migration[6.1]
  def change
    add_reference :marks, :markable, polymorphic: true, null: false, index: true
  end
end
