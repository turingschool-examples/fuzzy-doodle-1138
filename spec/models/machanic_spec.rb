require 'rails_helper'

RSpec.describe Machanic, type: :model do
  describe 'relationships' do
    it { should have_many :machanic_rides }
    it { should have_many(:rides).through(:machanic_rides) }
  end
end