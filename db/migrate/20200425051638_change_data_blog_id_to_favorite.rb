class ChangeDataBlogIdToFavorite < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :book_id, :blog_id
  end
end
