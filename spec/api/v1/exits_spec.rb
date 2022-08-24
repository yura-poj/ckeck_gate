# frozen_string_literal: true

require 'rails_helper'

describe 'Exits API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  describe 'POST /api/v1/exits' do
    let(:api_path) { '/api/v1/exits' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :post }
    end

    context 'authorized' do
      context 'Unverified user' do
        let(:access_token) { create(:access_token) }

        it 'returns 422 status' do
          post api_path,
               params: { access_token: access_token.token, headers: headers }
          expect(response.status).to eq 422
        end

        it 'do not create exit' do
          expect do
            post api_path,
                 params: { access_token: access_token.token, headers: headers }
          end.to change(Gate, :count).by(0)
        end
      end

      context 'Verified user' do
        let(:user) { create(:user, verify: true) }
        let(:access_token) { create(:access_token, resource_owner_id: user.id) }
        it 'returns 201 status' do
          post api_path,
               params: { access_token: access_token.token, headers: headers }
          expect(response.status).to eq 201
        end

        it 'create exit' do
          expect do
            post api_path,
                 params: { access_token: access_token.token, headers: headers }
          end.to change(Gate, :count).by(1)
        end
      end
    end
  end
end
