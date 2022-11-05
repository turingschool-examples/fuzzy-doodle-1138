require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  let!(:naomi) {Mechanic.create!(name: 'Naomi', years_experience: 5)}
  let!(:khaela) {Mechanic.create!(name: 'Khaela', years_experience: 11)}
  let!(:tyler) {Mechanic.create!(name: 'Tyler', years_experience: 3)}

  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end
end