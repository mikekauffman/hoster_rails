require 'spec_helper'

feature 'Interacting with the application' do

  scenario 'Index displays welcome' do

    visit '/'
    expect(page).to have_content 'Welcome'

  end

end