# frozen_string_literal: true

FactoryBot.define do
  factory :revoked_token do
    token do
      'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozNiwiZW1haWwiOiJsZUBkb3lsZS1hcm1zdHJvbmcub3JnIiwi
       ZXhwIjoxNjAzMzU5Mjc2fQ.qWNH4wJafCUg37uG8rI1gDaFT8ebpxLljCs1vEbQxfc'
    end
  end
end
