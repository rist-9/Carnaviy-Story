class BlogCommentsController < ApplicationController

	def create
		blog = Blog.find(params[:blog_id])
	    comment = current_user.blog_comments.new(blog_comment_params)
	    comment.blog_id = blog.id
	    comment.save
	    redirect_to blog_path(blog)
	end

	private
	def blog_comment_params
		params.require(:blog_comment).permit(:comment)
	end

	def blog_params
      	params.require(:blog).permit(:title,:introduction,:image,:genres_id)
    end
end
