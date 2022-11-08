require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_numericality_of :thrill_rating}
  end
end