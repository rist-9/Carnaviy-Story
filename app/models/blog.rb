class Blog < ApplicationRecord

	belongs_to :user
	has_many :blog_comments, dependent: :destroy
	attachment :image
	has_many :favorites, dependent: :destroy
        def favorited_by?(user)
          Favorite.where(user_id: user.id).exists?
        end
    validates :title, presence: true
	validates :introduction, presence: true, length: {maximum: 200}
end
