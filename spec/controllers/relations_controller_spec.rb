# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RelationsController, type: :controller do
  let(:kid) { create(:kid) }
  let(:parent) { create(:parent) }

  before { login(kid) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new relation in the database' do
        expect do
          post :create, params: { addressee_id: parent.id }
        end.to change(Relation, :count)
      end
    end

    context 'with invalid attributes' do
      let!(:relation) { create(:relation, sender: kid, addressee: parent) }
      it 'does not save the realtion' do
        expect do
          post :create, params: { addressee_id: parent.id }
        end.to_not change(Relation, :count)
      end

      it 'does not save the second relation' do
        login(parent)
        expect do
          post :create, params: { addressee_id: kid.id }
        end.to_not change(Relation, :count)
      end
    end
  end
end
