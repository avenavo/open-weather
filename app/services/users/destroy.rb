# frozen_string_literal: true

module Users
  class Destroy < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      user.destroy!
    end

    private

    attr_reader :user
  end
end
