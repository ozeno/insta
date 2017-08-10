class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all
  end

  def show
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new pic_params
    if @pic.save
      redirect_to @pic, notice: 'Saved!'
    else
      render 'new'
    end
  end

  private
    def pic_params
      params.require(:pic).permit(:title, :description)
    end

    def set_pic
      @pic = Pic.find(params[:id])
    end
end
