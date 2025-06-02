class CreateHashtagsSystem < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.string :name, null: false, index: { unique: true }
    end

    create_table :hashtag_subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :hashtag, foreign_key: true
      t.timestamps
      t.index [:user_id, :hashtag_id], unique: true
    end

    create_table :micropost_hashtags do |t|
      t.references :micropost, foreign_key: true
      t.references :hashtag, foreign_key: true
      t.index [:micropost_id, :hashtag_id], unique: true
    end
  end
end
