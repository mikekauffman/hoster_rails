require 'spec_helper'

feature 'Interacting with the application' do

  scenario 'Homepage displays form where parties can be added to the waitlist' do

    visit '/'
    fill_in 'party_name', with: 'Kauffman'
    fill_in 'party_size', with: 4
    fill_in 'party_phone', with: '5555555555'
    click_on 'Submit'

    expect(page).to have_content 'Kauffman'
    expect(page).to have_content '4'
    expect(page).to have_content '5555555555'
    expect(page).to have_content '0 minutes'

    fill_in 'party_name', with: 'Skaff'
    fill_in 'party_size', with: 8
    fill_in 'party_phone', with: '5554445555'
    click_on 'Submit'

    expect(page).to have_content 'Skaff'
    expect(page).to have_content '8'
    expect(page).to have_content '5554445555'
    expect(page).to have_content '0 minutes'

    page.first(:button, "Remove").click

    expect(page).to_not have_content 'Kauffman'
    expect(page).to have_content 'Skaff'

  end

end