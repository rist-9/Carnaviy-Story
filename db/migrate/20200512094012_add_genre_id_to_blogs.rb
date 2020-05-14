class AddGenreIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :genre_id, :integer
  end
end
