class AddProducthuntUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :producthunt_url, :string
  end
end
