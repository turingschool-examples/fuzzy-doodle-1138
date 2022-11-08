require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:mechanic) }
    it { should belong_to(:ride) }
  end
end