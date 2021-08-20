class ChecksController < ApplicationController
  def index
    @check = Check.last
    @check1 = Check.all.order(id: "DESC")[0]
    @check2 = Check.all.order(id: "DESC")[1]
    @check3 = Check.all.order(id: "DESC")[2]
    @check4 = Check.all.order(id: "DESC")[3]
    @check5 = Check.all.order(id: "DESC")[4]
    @check6 = Check.all.order(id: "DESC")[5]
    @check7 = Check.all.order(id: "DESC")[6]
    @check8 = Check.all.order(id: "DESC")[7]
    @check9 = Check.all.order(id: "DESC")[8]
    @check10 = Check.all.order(id: "DESC")[9]

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
