class ChecksController < ApplicationController
  def index
    @check = Check.last
    @check1 = Check.all.order(id: "DESC")[0]
    @check2 = Check.all.order(id: "DESC")[1]
    @complete = Complete.last
  end

  def create
    @check = Check.new
    if @check.save
      redirect_to root_path
    end
  end
end
