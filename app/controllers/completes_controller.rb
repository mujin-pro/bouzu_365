class CompletesController < ApplicationController
  def create
    @complete = Complete.new
    if @complete.save
      redirect_to root_path
    end
  end
end
