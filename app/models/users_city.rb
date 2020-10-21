# frozen_string_literal: true

class UsersCity < ApplicationRecord
  belongs_to :user
  belongs_to :city
end
