class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.references :micropost, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
