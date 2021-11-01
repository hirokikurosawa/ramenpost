class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :posted_image
      t.text :posted_content

      t.timestamps
    end
  end
end
