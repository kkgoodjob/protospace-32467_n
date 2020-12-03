class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    if Prototype.create(prototype_params)
      redirect_to root_path
    else
      render :index
    end
  end
  
  def show
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id, user_name: current_user.name)
  end
end
