require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  let!(:naomi) {Mechanic.create!(name: 'Naomi', years_experience: 5)}
  let!(:khaela) {Mechanic.create!(name: 'Khaela', years_experience: 11)}
  let!(:tyler) {Mechanic.create!(name: 'Tyler', years_experience: 3)}

  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe '#average_experience' do
      it 'returns the average years of experience for all mechanics' do
        expect(Mechanic.average_experience).to eq(6)
      end
    end
  end
end