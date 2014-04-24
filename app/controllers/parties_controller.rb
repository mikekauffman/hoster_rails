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

  def remove_from_list
    party = Party.find(params[:id])
    party.update(display: false)
    redirect_to '/'
  end

end