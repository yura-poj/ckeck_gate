require 'rails_helper'

RSpec.describe RelationPolicy, type: :policy do
  let(:admin) { create(:admin) }
  let(:kid) { create(:kid) }
  let(:other_kid) { create(:kid) }
  let(:parent) { create(:parent) }
  let(:other_parent) { create(:parent) }

  let(:relation) { create(:relation, addressee: parent ,sender: kid) }

  subject { described_class }

  permissions :create? do
    it 'grants access if kid add relation to parent' do
      expect(subject).to permit(kid, parent)
    end

    it 'grants access if kid add relation to other kid' do
      expect(subject).to_not permit(kid, other_kid)
    end

    it 'grants access if parent add relation to kid' do
      expect(subject).to permit(parent, kid)
    end

    it 'grants access if parent add relation to other parent' do
      expect(subject).to_not permit(parent, other_parent)
    end

    it 'grants access if admin add relation to kid' do
      expect(subject).to_not permit(admin, kid)
    end
  end

  permissions :accept? do

    it 'grants access if sender accept' do
      expect(subject).to_not permit(kid, relation)
    end

    it 'grants access if addressee accept' do
      expect(subject).to permit(parent, relation)
    end

    it 'grants access if admin accept' do
      expect(subject).to_not permit(admin, relation)
    end
  end

  permissions :decline? do

    it 'grants access if sender decline' do
      expect(subject).to_not permit(kid, relation)
    end

    it 'grants access if addressee decline' do
      expect(subject).to permit(parent, relation)
    end

    it 'grants access if admin decline' do
      expect(subject).to_not permit(admin, relation)
    end
  end

  permissions :destroy? do
    it 'grants access if admin' do
      expect(subject).to permit(admin, relation)
    end

    it 'grants access if sender' do
      expect(subject).to permit(admin, relation)
    end

    it 'grants access if sender' do
      expect(subject).to_not permit(parent, relation)
    end
  end
end
