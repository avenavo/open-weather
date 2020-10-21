# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersCitiesController, type: :request do
  subject(:response_body) do
    JSON.parse subject.body
  end

  describe 'GET /api/v1/users_cities' do
    subject do
      get '/api/v1/users_cities', headers: headers
      response
    end

    let!(:user) { create(:user) }
    let!(:users_cities) { create_list(:users_city, 10, user: user) }

    context 'with session' do
      let(:headers) { with_token_for(user) }
      it { expect(subject).to have_http_status(200) }
      it { expect(response_body['data'].count).to eq(10) }
    end

    context 'without session' do
      let(:headers) {}
      it { expect(subject).to have_http_status(401) }
    end
  end
end
