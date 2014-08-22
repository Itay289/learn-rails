class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(secure_params)
    if @post.save
      flash[:notice] = "Fill this form before posting: #{@post.post}"
      redirect_to new_contact_path
    else
      render :new
    end
  end
    
    private

    def secure_params
      params.require(:post).permit(:head, :title, :post)
    end

end