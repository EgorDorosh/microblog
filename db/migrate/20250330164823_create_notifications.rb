class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.references :actor, polymorphic: true, null: false
      t.references :notifiable, polymorphic: true, null: false
      t.string :description

      t.timestamps
    end
  end
end
