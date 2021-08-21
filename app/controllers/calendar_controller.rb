class CalendarController < ApplicationController
  def index
    @checks = Check.all
  end
end
