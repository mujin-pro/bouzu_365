class ChecksController < ApplicationController
  def index
    @check = Check.last
    @check1 = Check.all.order(id: "DESC")[0]
    @check2 = Check.all.order(id: "DESC")[1]
    @complete = Complete.last
  end

  def new
    @check = Check.new
  end

  def create
    @check = Check.create(check_params)
    if @check.save
      redirect_to root_path
    end
  end

  private

  def check_params
    params.require(:check).permit(:activities).merge(user_id: current_user.id)
  end
end
