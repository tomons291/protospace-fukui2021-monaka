class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :destroy]

  def index
    @prototypes = Prototype.all
  end


  def show
    @prototype= Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  # def destroy
  #   prototype = Prototype.find(params[:id])
  #   if prototype.destroy
  #     redirect_to root_path
  #   else
  #     render action :show
  #   end
  # end


  def destroy
    #ログインしていなかったら、ログインページへ遷移する
    if user_signed_in?
        #ログインユーザーと選択したプロトタイプのユーザーが一致しないとき、top画面にとどまる（編集画面は開けない）
        prototype = Prototype.find(params[:id])
        if current_user.id == prototype.user_id
          prototype.destroy
          redirect_to root_path
        else
         redirect_to root_path
        end
    else
       redirect_to new_user_session_path
    end
 end





  private

  def prototype_params
    params.require(:prototype).permit(:title, :concept, :catchcopy, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end
