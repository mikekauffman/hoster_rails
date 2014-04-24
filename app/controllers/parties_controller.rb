class PartiesController < ApplicationController
  def index
    if Party
      @parties = Party.all
    end
  end

  def create
    Party.create(name: params[:party_name], size: params[:party_size], phone: params[:party_phone])
    redirect_to '/'
  end

  def remove_from_list
    find_by_id.update(display: false)
    redirect_to '/'
  end

  def text
    send_text(find_by_id.phone)
    redirect_to '/'
  end

private

  def find_by_id
    Party.find(params[:id])
  end

  def send_text(phone)
  account_sid = 'ACed7d490605ada89082d0588be5b62908'
  auth_token = 'a34a00e7199e7c09ee448651d1013a03'
  client = Twilio::REST::Client.new account_sid, auth_token
  client.account.messages.create({
                                   :from => '+12025172698',
                                   :to => phone,
                                   :body => 'Your table is ready'
                                 })
  end

end