class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :cover_image_url
      t.string :author_name
      t.string :audio_url
      t.references :feed, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
