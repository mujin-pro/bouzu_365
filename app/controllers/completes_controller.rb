class CompletesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_complete

  def new
    @complete = Complete.new
  end

  def create
    @complete = Complete.create(complete_params)
    render json: { post: @complete }
  end

  def edit
    @complete = Complete.last
  end

  def update
    @completes = Complete.where(user_id: current_user.id)
    @complete = @completes.last
    if @complete.updated_at.strftime('%-m月%-d日') == Date.today.strftime('%-m月%-d日')
      @complete.destroy
      @complete_update = Complete.create(complete_params)
      redirect_to root_path if @complete_update.save
    end
  end

  def destroy
    @completes = Complete.where(user_id: current_user.id)
    @complete = @completes.last
    redirect_to root_path if @complete.destroy
  end

  private

  def complete_params
    params.require(:complete).permit(:activity).merge(user_id: current_user.id)
  end

  def user_complete
    if Complete.where(user_id: current_user.id).present? && user_signed_in?
      @user_all_completes = Complete.where(user_id: current_user.id)
      @user_last_complete = @user_all_completes.last
      @user_all_completes_order = @user_all_completes.order(id: 'DESC')
    end
  end
end
