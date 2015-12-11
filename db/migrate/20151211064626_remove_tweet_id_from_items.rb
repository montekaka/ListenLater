class RemoveTweetIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :tweet_id, :integer
  end
end
