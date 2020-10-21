# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ForecastsController, type: :request do
  subject(:response_body) do
    JSON.parse subject.body
  end

  describe 'GET /api/v1/users_cities/:id/forecast' do
    subject do
      get "/api/v1/users_cities/#{id}/forecast", headers: headers
      response
    end

    let!(:user) { create(:user) }
    let!(:city) { create(:city, country: 'PL', name: 'Warsaw', external_id: 756_135) }
    let!(:users_city) { create(:users_city, user: user, city: city) }

    context 'with session' do
      let(:headers) { with_token_for(user) }

      context 'when the city exists' do
        let(:id) { users_city.id }
        it { expect(subject).to have_http_status(200) }
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
