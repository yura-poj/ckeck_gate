require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: 'aga@example.com') }
  describe 'set_best' do
    it 'return email' do
      expect(user.email).to eq 'aga@example.com'
    end
  end
end
