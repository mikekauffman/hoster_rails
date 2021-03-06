require 'date'

class PartiesController < ApplicationController

  def index
    if Party
      @parties = Party.all
    end
  end

  def create
    Party.create(
      name: params[:party_name],
      size: params[:party_size],
      phone: params[:party_phone],
      day_of_week: (Date::DAYNAMES[Date.today.wday]),
      quoted_wait_time: params[:party_est_wait]
    )
    redirect_to '/'
  end

  def remove_from_list
    find_by_id.update(display: false, seated_time: Time.now)
    redirect_to '/'
  end

  def text
    send_text(find_by_id.phone)
    redirect_to '/'
  end

  def stats
    @total_average_wait = total_avg_wait
    @day_avgs_hash = Hash[days_of_week.zip(day_avgs)]
    @total_avg_quoted = quoted_avg_wait
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

  def total_avg_wait
    waited_for = []
    parties = Party.all
    parties.each do |party|
      waited_for << (party.seated_time - party.created_at)
    end
    wait_sum = 0
    waited_for.each do |x|
      wait_sum += x
    end
    ((wait_sum/waited_for.count)/60).to_i
  end

  def average_wait_per_day(day)
    parties = Party.all
    day_array = []
    parties.each do |party|
      if party.day_of_week == day
        day_array << (party.seated_time - party.created_at)
      end
    end
    day_sum = 0
    day_array.each do |x|
      day_sum += x if x > 0
    end
    if day_array.count > 0
      ((day_sum/day_array.count)/60).to_i
    else
      "No data for #{day} yet"
    end
  end

  def days_of_week
    ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  end

  def day_avgs
    day_avg_array = []
    days_of_week.each do |day|
      day_avg_array << average_wait_per_day(day)
    end
    day_avg_array
  end

  def quoted_avg_wait
    quoted = []
    parties = Party.all
    parties.each do |party|
      quoted << ((party.quoted_wait_time).to_i)
    end
    quoted_sum = 0
    quoted.each do |x|
      quoted_sum += x
    end
    ((quoted_sum/quoted.count)).to_i
  end
end