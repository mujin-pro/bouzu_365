class ChecksController < ApplicationController
  def index
  end

  def create
    @check = Check.new(check_params)
  end

  private

  def check_params
    params["check_in"] = 1
    params["check_out"] = 2
    params["skip"] = 3
    params.require(:check).permit(:check_in, :check_out, :skip).merge(user_id: current_user.id)
  end

end
