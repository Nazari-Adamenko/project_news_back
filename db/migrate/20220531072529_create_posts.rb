class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :tags
      t.string :user_id
      t.text :image
      t.boolean :is_deleted, null: false, :default => "false"
      t.text :content

      t.timestamps
    end
  end
end
