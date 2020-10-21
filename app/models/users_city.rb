# frozen_string_literal: true

class UsersCity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  delegate :name, to: :city
  delegate :country, to: :city
  delegate :external_id, to: :city
end
