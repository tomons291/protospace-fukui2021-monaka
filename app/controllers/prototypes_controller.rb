class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit,:show]
  before_action :move_to_index, except: [:index, :show]

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


  def edit
    @prototype= Prototype.find(params[:id])
    #ログインしていなかったら、ログインページへ遷移する
     if user_signed_in?
        elseif current_user.id == prototype.user_id #ログインユーザーと選択したプロトタイプのユーザーが一致しないとき、詳細画面にとどまる（編集画面は開けない）
          @prototype = Prototype.new(prototype_params)
        else
          redirect_to user_registration_path
      end 
    #ログインユーザーと選択したプロトタイプのユーザーが一致しないとき、詳細画面にとどまる（編集画面は開けない）
    
    # end 
  end

  def update
    #️空白で登録するとエラーが出て、そのままの画面になる
     prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
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
