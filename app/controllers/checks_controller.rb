class ChecksController < ApplicationController
before_action :authenticate_user!, except: [:index]
before_action :user_checks, only: [:index]
before_action :user_completes, only: [:index, :show]
before_action :all_checks, only: [:index]


  def index
    if user_signed_in? && Complete.last.present?
      @completes = Complete.where(user_id: current_user.id)
      @complete = @completes.last
    end
  end

  def new
    @check = Check.new
  end

  def create
    @check = Check.create(check_params)
    render json:{ post: @check }
  end

  def edit
    @check = Check.last
  end

  def update
    @checks = Check.where(user_id: current_user.id)
    @check = @checks.last
    if @check.updated_at.strftime("%-m月%-d日") == Date.today.strftime("%-m月%-d日")
      @check.destroy
      @check_update = Check.create(check_params)
      if @check_update.save
        redirect_to root_path
      end
    end
  end

  def destroy
    @checks = Check.where(user_id: current_user.id)
    @check = @checks.last
    if @check.destroy
      redirect_to root_path
    end
  end

  def show
    @check = Check.find(params[:id])
    if @user_all_completes.present?
      @user_all_completes.each do |complete|
        if @check.updated_at.strftime("%-m月%-d日") == complete.updated_at.strftime("%-m月%-d日")
          @complete = complete
        end
      end
    end
  end

  private

  def check_params
    params.require(:check).permit(:goal).merge(user_id: current_user.id)
  end

  def user_checks
    if user_signed_in? && Check.where(user_id: current_user.id).present?
      @user_all_checks = Check.where(user_id: current_user.id)
      @user_last_check = @user_all_checks.last
      @user_all_checks_order = @user_all_checks.order(id: "DESC")
    end
  end

  def user_completes
    if user_signed_in? && Complete.where(user_id: current_user.id).present?
      @user_all_completes = Complete.where(user_id: current_user.id)
      @user_last_complete = @user_all_completes.last
      @user_all_completes_order = @user_all_completes.order(id: "DESC")
    end
  end

  def all_checks
    if Check.all.present? && user_signed_in?
      @all_checks = Check.all
      @last_check = Check.last
      @all_checks_order = @all_checks.order(id: "DESC")
    end
  end

end
