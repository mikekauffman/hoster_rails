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

  def text
    party = Party.find(params[:id])
    account_sid = 'ACed7d490605ada89082d0588be5b62908'
    auth_token = 'a34a00e7199e7c09ee448651d1013a03'
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create({
                                     :from => '+12025172698',
                                     :to => party.phone,
                                     :body => 'Your table is ready'
                                   })
    redirect_to '/'
  end

end