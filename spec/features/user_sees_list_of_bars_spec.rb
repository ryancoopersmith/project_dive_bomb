require 'rails_helper'

# [] Visiting the `/bars` path should contain a list of restaurants.
# [] Visiting the `/bar/10` path should show the restaurant details for a restaurant with the ID of 10.
# [] Visiting the root path should display a list of all restaurants.
feature "visitor sees a list of bars" do
  scenario "sees a list of bars" do
    oscars = Bar.create(name: 'Oscars', address: '1524 Sansom St', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '2152152152', rating: 4.5)
    oscars1 = Bar.create(name: 'Oscars1', address: '1523 Sansom St', city: 'Philadelphia', state: 'PA', zip: '19137', phone_number: '2152152152', rating: 4, url: "www.oscarstavern.com", image_url: "www.imageurl.com")

    visit bars_path

    expect(page).to have_content oscars.name
    expect(page).to have_content oscars.address
    expect(page).to have_content oscars.city
    expect(page).to have_content oscars.state
    expect(page).to have_content oscars.zip
    expect(page).to have_content oscars.rating
    expect(page).to have_content oscars.phone_number
  end
end
