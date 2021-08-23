class ChecksController < ApplicationController
  def index
    if user_signed_in? && Check.last.present?
      @checks = Check.where(user_id: current_user.id)
      @check = @checks.last
    end

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

    if user_signed_in? && Complete.last.present?
      @completes = Complete.where(user_id: current_user.id)
      @complete = Complete.last
    end
  end

  def new
    @check = Check.new
  end

  def create
    @check = Check.create(check_params)
    @check.save
  end

  def edit
    @check = Check.last
  end

  def update
    @check = Check.last
    if @check.updated_at.strftime("%-m月%-d日") == Date.today.strftime("%-m月%-d日")
      if @check.update(check_params)
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

  private

  def check_params
    params.require(:check).permit(:activities).merge(user_id: current_user.id)
  end
end
