class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[show edit update destroy]
  before_action :user_checks, only: [:index]
  before_action :user_completes, only: [:index]
  before_action :all_checks, only: [:index]

  # GET /calendars or /calendars.json
  def index
    @calendars = Calendar.all
    @completes = Complete.all
    @donations = Donation.all
  end

  # GET /calendars/1 or /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars or /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1 or /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1 or /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def calendar_params
    params.require(:calendar).permit(:name, :start_time)
  end

  def user_checks
    if user_signed_in? && Check.where(user_id: current_user.id).present?
      @user_all_checks = Check.where(user_id: current_user.id)
      @user_last_check = @user_all_checks.last
      @user_all_checks_order = @user_all_checks.order(id: 'DESC')
    end
  end

  def user_completes
    if user_signed_in? && Complete.where(user_id: current_user.id).present?
      @user_all_completes = Complete.where(user_id: current_user.id)
      @user_last_complete = @user_all_completes.last
      @user_all_completes_order = @user_all_completes.order(id: 'DESC')
    end
  end

  def all_checks
    if Check.all.present? && user_signed_in?
      @all_checks = Check.all
      @last_check = Check.last
      @all_checks_order = @all_checks.order(id: 'DESC')
    end
  end
end
