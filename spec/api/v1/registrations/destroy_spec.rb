# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
  describe 'DELETE /api/v1/registrations' do
    subject do
      delete '/api/v1/registrations', headers: headers
      response
    end

    let!(:user) { create(:user) }

    context 'with session' do
      let(:headers) { with_token_for(user) }

      it { expect(subject).to have_http_status(200) }
      it { expect { subject }.to change { User.count }.from(1).to(0) }
    end

    context 'without session' do
      let(:headers) {}
      it { expect(subject).to have_http_status(401) }
    end
  end
end
