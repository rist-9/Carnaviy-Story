class RemoveGenresIdFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :genres_id, :integer
  end
end
