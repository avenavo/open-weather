# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersCitiesController, type: :request do
  describe 'DELETE /api/v1/users_cities/:id' do
    subject do
      delete "/api/v1/users_cities/#{id}", headers: headers
      response
    end

    let!(:user) { create(:user) }
    let!(:users_city) { create(:users_city, user: user) }

    context 'with session' do
      let(:headers) { with_token_for(user) }

      context 'when the city exists' do
        let(:id) { users_city.id }
        it { expect { subject }.to change { UsersCity.count }.from(1).to(0) }
      end

      context 'when the city does not exist' do
        let(:id) { -1 }
        it { expect(subject).to have_http_status(404) }
      end
    end

    context 'without session' do
      let(:headers) {}
      let(:id) { 1 }
      it { expect(subject).to have_http_status(401) }
    end
  end
end
