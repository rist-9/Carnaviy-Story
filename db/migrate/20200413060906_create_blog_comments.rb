class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
    	t.text :comment, null: false
    	t.integer :user_id
    	t.integer :post_image_id

    	t.timestamps
    end
  end
end
