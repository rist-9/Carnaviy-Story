class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
    	t.integer :genres_id, null: false
    	t.string :title, null: false
    	t.text :introduction, null: false
    	t.string :image_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
