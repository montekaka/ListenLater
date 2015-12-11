class CreateTweetsSinceIds < ActiveRecord::Migration
  def change
    create_table :tweets_since_ids do |t|
      t.integer :tweet_id

      t.timestamps null: false
    end
  end
end
