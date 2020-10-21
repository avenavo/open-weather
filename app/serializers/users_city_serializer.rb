# frozen_string_literal: true

class UsersCitySerializer
  include JSONAPI::Serializer

  attributes :name, :country
end
