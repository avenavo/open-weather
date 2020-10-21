# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
  describe 'POST /api/v1/registrations' do
    subject do
      post '/api/v1/registrations', params: params
      response
    end

    context 'with correct params' do
      let(:params) do
        {
          email: email,
          password: password,
          password_confirmation: password_confirmation
        }
      end

      let(:email) { Faker::Internet.email }
      let(:password) { Faker::Internet.password }
      let(:password_confirmation) { Faker::Internet.password }

      context 'with valid params' do
        let(:password_confirmation) { password }

        it { expect { subject }.to change { User.count }.from(0).to(1) }
      end

      context 'with invalid params' do
        describe 'invalid email' do
          let(:email) { 'not_an_email' }
          it { expect(subject).to have_http_status(400) }
        end

        describe 'invalid password confirmation' do
          let(:password_confirmation) { "#{password}_123" }
          it { expect(subject).to have_http_status(400) }
        end
      end
    end

    context 'without params' do
      let(:params) { {} }

      it { expect(subject).to have_http_status(400) }
    end
  end
end
