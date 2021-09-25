class PrototypesController < ApplicationController
  
  before_action :authenticate_user!, only: [:edit, :destroy, :new]
  before_action :set_prototype, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  # before_action :move_to_index_new, except: [:index, :show]
  

  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params) 
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def  destroy
    @prototype.destroy
    redirect_to root_path
  end


  private

  def prototype_params
    params.require(:prototype).permit(:title, :concept, :catchcopy, :image, :name).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  
  def move_to_index
    unless  current_user.id == @prototype.user_id 
      redirect_to root_path
    end
  end

  # def move_to_index
  #   unless  current_user.id == @prototype.user_id 
  #     redirect_to root_path
  #   end
  # end


  # def move_to_index_new
  #   unless  user_signed_in?
  #     redirect_to root_path
  #   end
  # end

end
