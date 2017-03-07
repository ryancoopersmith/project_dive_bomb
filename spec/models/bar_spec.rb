require 'rails_helper'

name 'Rays Happy Birthday Bar'
url 'www.rayshappybirthdaybar.com'
address '123 Passyunk Ave'
city 'Philadelphia'
state 'PA'
zip '19147'
phone_number '215-215-2152'
image_url 'nautilus_shell.jpg'
rating '4'

describe Bar do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:rating) }
end
