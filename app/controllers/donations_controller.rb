class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    if @donation.valid?
      pay_item
      if @donation.save
        redirect_to root_path
      end
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:payment_day, :price).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: donation_params[:price],
        card: donation_params[:token],
        currency: 'jpy'
    )
  end
end
