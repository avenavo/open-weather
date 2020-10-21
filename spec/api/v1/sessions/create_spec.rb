# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :request do
  describe 'POST /api/v1/sessions' do
    subject do
      post '/api/v1/sessions', params: params
      response
    end

    context 'with correct params' do
      let(:params) do
        {
          email: email,
          password: password
        }
      end

      let(:email) { Faker::Internet.email }
      let(:password) { Faker::Internet.password }

      context 'when the user exists' do
        let!(:user) { create(:user, password: :password) }

        let(:email) { user.email }

        context 'with invalid password' do
          it { expect(subject).to have_http_status(422) }
        end

        context 'with valid password' do
          let(:password) { :password }

          it { expect(subject).to have_http_status(201) }
        end
      end

      context 'when the user does not exist' do
        it { expect(subject).to have_http_status(422) }
      end
    end

    context 'with incorrect params' do
      let(:params) { {} }

      it { expect(subject).to have_http_status(400) }
    end
  end
end
