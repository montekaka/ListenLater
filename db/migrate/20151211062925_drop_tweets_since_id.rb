class DropTweetsSinceId < ActiveRecord::Migration
  def up
  	drop_table :tweets_since_ids
  end
end
