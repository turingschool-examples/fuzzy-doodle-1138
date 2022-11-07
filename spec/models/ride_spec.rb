require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :machanic_rides }
    it { should have_many(:machanics).through(:machanic_rides) }
  end
end