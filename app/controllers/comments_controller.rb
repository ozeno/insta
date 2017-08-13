class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pic

  def index
    redirect_to @pic
  end

  def create
    @comment = @pic.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    if @comment.errors.any?
      render 'form'
    else
      redirect_to @pic
    end
  end

  def destroy
    @comment = @pic.comments.find(params[:id])
    @comment.destroy if current_user == @comment.user
    
    redirect_to @pic
  end

  private
    def set_pic
      @pic = Pic.find(params[:pic_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
