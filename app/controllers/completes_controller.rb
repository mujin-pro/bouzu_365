class CompletesController < ApplicationController

  def new
    @complete = Complete.new
  end

  def create
    @complete = Complete.create(complete_params)
    if @complete.save
      redirect_to root_path
    end
  end
  
  private

  def complete_params
    params.require(:complete).permit(:activities).merge(user_id: current_user.id)
  end
end
