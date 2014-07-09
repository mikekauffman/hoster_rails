require 'spec_helper'

describe Party do
  it "allows a party to be created" do
    party = Party.create!(
      name: "Kauffman",
      size: "10",
      phone: "7033718749",
      day_of_week: (Date::DAYNAMES[Date.today.wday]),
      quoted_wait_time: 45
    )
    all_parties = Party.all
    expect(all_parties.last).to eq(party)
  end
end