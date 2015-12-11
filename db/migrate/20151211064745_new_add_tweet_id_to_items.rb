class NewAddTweetIdToItems < ActiveRecord::Migration
  def change
  	add_column :items, :tweet_id, :string
  end
end
