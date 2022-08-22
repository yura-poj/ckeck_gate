require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  permissions :show? do
    it 'grants access if user watch self' do
      expect(subject).to permit(user, user)
    end

    it 'grants access if user watch other' do
      expect(subject).to_not permit(user, User.new)
    end
  end
end
