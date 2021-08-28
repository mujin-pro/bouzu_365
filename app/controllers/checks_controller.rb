class ChecksController < ApplicationController
  def index
    if user_signed_in? && Check.last.present?
      @checks = Check.where(user_id: current_user.id)
      @check = @checks.last
      @check_user1 = @checks.order(id: "DESC")[0]
      @check_user2 = @checks.order(id: "DESC")[1]
      @check_user3 = @checks.order(id: "DESC")[2]
      @check_user4 = @checks.order(id: "DESC")[3]
      @check_user5 = @checks.order(id: "DESC")[4]
      @check_user6 = @checks.order(id: "DESC")[5]
      @check_user7 = @checks.order(id: "DESC")[6]
      @check_user8 = @checks.order(id: "DESC")[7]
      @check_user9 = @checks.order(id: "DESC")[8]
      @check_user10 = @checks.order(id: "DESC")[9]
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
      @complete = @completes.last
    end
  end

  def new
    @check = Check.new
  end

  def create
    @check = Check.create(check_params)
    render json:{ post: @check }
    # @check.save
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
    @completes = Complete.where(user_id: current_user.id)
    @completes.each do |complete|
      if @check.updated_at.strftime("%-m月%-d日") == complete.updated_at.strftime("%-m月%-d日")
        @complete = complete
      end
    end
  end

  private

  def check_params
    params.require(:check).permit(:activities).merge(user_id: current_user.id)
  end
end
