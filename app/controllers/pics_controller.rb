class PicsController < ApplicationController
  include PicsHelper

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pic, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :user_allowed?, only: [:edit, :update, :destroy]

  def index
    @pics = Pic.all.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build pic_params
    if @pic.save
      redirect_to @pic, notice: 'Saved!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update pic_params
      redirect_to @pic, notice: 'Updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  def upvote
    @pic.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @pic.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private
    def pic_params
      params.require(:pic).permit(:title, :description, :image)
    end

    def set_pic
      @pic = Pic.find(params[:id])
    end
end
