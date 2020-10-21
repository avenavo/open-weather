# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersCitiesController, type: :request do
  subject(:response_body) do
    JSON.parse subject.body
  end

  describe 'POST /api/v1/users_cities' do
    subject do
      post '/api/v1/users_cities', params: params, headers: headers
      response
    end

    let(:user) { create(:user) }

    context 'with session' do
      let(:headers) { with_token_for(user) }

      context 'with valid params' do
        let(:params) do
          {
            city_name: 'Warsaw',
            country_code: 'PL'
          }
        end

        context 'with valid city' do
          before do
            allow_any_instance_of(OpenWeatherCityValidator).to receive(:validate!) { city_h }
          end

          let(:city_h) do
            {
              'id' => 756_135,
              'name' => 'Warsaw',
              'coord' => {
                'lat' => 52.2298,
                'lon' => 21.0118
              },
              'country' => 'PL',
              'population' => 1_000_000,
              'timezone' => 7200,
              'sunrise' => 1_603_257_114,
              'sunset' => 1_603_294_131
            }
          end

          it { expect(subject).to have_http_status(201) }

          context 'when city exists' do
            let!(:city) do
              create(:city, external_id: city_h['id'], name: city_h['name'], country: city_h['country'])
            end

            it { expect { subject }.to change { City.count }.by(0) }
            it { expect { subject }.to change { UsersCity.count }.by(1) }
          end

          context 'when city does not exist' do
            it { expect { subject }.to change { City.count }.by(1) }
            it { expect { subject }.to change { UsersCity.count }.by(1) }
          end
        end

        context 'with invalid city' do
          before do
            allow_any_instance_of(OpenWeatherCityValidator).to receive(:validate!)
              .and_raise(OpenWeatherCityValidator::InvalidCity, :city_not_found)
          end

          it { expect(subject).to have_http_status(422) }
          it { expect(response_body['messages']).to eq(['city_not_found']) }
        end
      end

      context 'with invalid params' do
        let(:params) do
          {
            city_name: 'Warsaw',
            country_code: ''
          }
        end

        it { expect(subject).to have_http_status(400) }
      end
    end

    context 'without session' do
      let(:headers) {}
      let(:params) {}
      it { expect(subject).to have_http_status(401) }
    end
  end
end
