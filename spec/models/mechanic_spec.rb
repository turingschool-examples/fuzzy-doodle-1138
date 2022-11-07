require 'rails_helper'

RSpec.describe Mechanic do 
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_numericality_of :years_experience}
  end
end