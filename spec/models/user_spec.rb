require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: 'aga@example.com') }
  let(:admin) { create(:user, admin: true) }
  describe 'admin?' do
    it 'return true' do
      expect(admin.admin?).to eq true
    end

    it 'return false' do
      expect(user.admin?).to eq false
    end
  end
end
