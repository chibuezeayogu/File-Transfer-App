require 'rails_helper'

RSpec.describe UserDocumentsController, type: :controller do
  let(:user) do
    create(:user, 
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password')
  end
end
