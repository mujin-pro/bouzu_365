class CompletesController < ApplicationController

  def new
    @complete = Complete.new
  end

  def create
    @complete = Complete.create(complete_params)
    render json:{ post: @complete }
    # @complete.save
  end
  
  def edit
    @complete = Complete.last
  end

  def update
    @complete = Complete.last
    if @complete.updated_at.strftime("%-m月%-d日") == Date.today.strftime("%-m月%-d日")
      if @complete.update(complete_params)
        redirect_to root_path
      end
    end
  end

  def destroy
    @completes = Complete.where(user_id: current_user.id)
    @complete = @completes.last
    if @complete.destroy
      redirect_to root_path
    end
  end

  private

  def complete_params
    params.require(:complete).permit(:activities).merge(user_id: current_user.id)
  end
end
