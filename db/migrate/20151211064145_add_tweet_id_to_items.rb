class AddTweetIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :tweet_id, :integer
  end
end
