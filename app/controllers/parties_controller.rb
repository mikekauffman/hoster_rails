class PartiesController < ApplicationController
  def index
    if Party
    @parties = Party.all
    end
  end

  def create
    party = Party.new
    party.name = params[:party_name]
    party.size = params[:party_size]
    party.phone = params[:party_phone]
    party.save
    redirect_to '/'
  end

end