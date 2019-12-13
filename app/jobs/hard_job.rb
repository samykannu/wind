class HardJob < ApplicationJob
  include Sidekiq::Worker
  def perform(user)
    UserMailer.welcome_email(user).deliver
  end
end
