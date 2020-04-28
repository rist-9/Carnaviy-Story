class HomeController < ApplicationController
  def top
    if user_signed_in?
      if User.find(current_user.id).status == false
        sign_out_and_redirect(current_user)
      end
    end
  end

  def creare
    @blog = Blog.new(blog_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @blogs = Blog.all
    @blog.user_id = current_user.id
    if @blog.save #入力されたデータをdbに保存する。
      redirect_to blog_path(@blog), notice: "successfully created book!"#保存された場合の移動先を指定。
    else
      @user = current_user
      render 'index'
    end
  end
end
