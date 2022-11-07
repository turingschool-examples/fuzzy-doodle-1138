require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :mechanic_rides}
    it { should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:thrill_rating)}
    it {should validate_numericality_of(:thrill_rating).is_greater_than(0)}
    it {should validate_presence_of(:open)}
    it {should validate_inclusion_of(:open).in?([true, false])}

  end
end
