class PrototypesController < ApplicationController
  #before_action :set_prototype, only: [:edit, :show]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  
  
end
