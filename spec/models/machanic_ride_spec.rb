require 'rails_helper'

RSpec.describe MachanicRide, type: :model do
  describe 'relationships' do
    it { should belong_to :machanic }
    it { should belong_to :ride }
  end
end
