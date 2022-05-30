class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.text :title
      t.text :tags
      t.text :image
      t.string :user_id
      t.text :content
      t.boolean :is_delited

      t.timestamps
    end
  end
end
