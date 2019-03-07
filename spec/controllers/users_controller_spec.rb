# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_params) do
    {
      email: 'example@mail.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end
  let(:invalid_params) do
    {
      email: 'example@mail.com',
      password: 'password',
      password_confirmation: ''
    }
  end

  describe '#create' do
    context 'when a valid params is provided' do
      subject { post 'create', params: valid_params }
      it 'registers a new user' do
        subject
        expect(response).to redirect_to root_path
        expect(response.status).to eq(302)
        expect(User.count).to eq 1
        expect(User.first.email).to eq valid_params[:email]
      end
    end

    context 'when a invalid params is provided' do
      subject { post 'create', params: invalid_params }
      it 'returns a validation error' do
        subject
        expect(response).to redirect_to register_path
        expect(response.status).to eq(302)
        expect(flash[:danger])
          .to match(["Password confirmation doesn't match Password", "Password confirmation can't be blank"])
      end
    end
  end
end
