# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    create(:user,
           email: Faker::Internet.email,
           password: 'password',
           password_confirmation: 'password')
  end
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
        expect(subject).to redirect_to documents_path
        expect(subject).to have_http_status(302)
        expect(User.count).to eq 1
        expect(User.first.email).to eq valid_params[:email]
      end
    end

    context 'when a invalid params is provided' do
      subject { post 'create', params: invalid_params }
      it 'returns a validation error' do
        expect(subject).to redirect_to register_path
        expect(subject).to have_http_status(302)
        expect(flash[:danger])
          .to match(["Password confirmation doesn't match Password", "Password confirmation can't be blank"])
      end
    end
  end
  describe '#sign_in' do
    context 'when a valid params is provided' do
      subject { post 'sign_in', params: { email: user.email, password: user.password } }
      it 'sign\'s in a user' do
        expect(subject).to redirect_to documents_path
        expect(subject).to have_http_status(302)
        expect(User.count).to eq 1
      end
    end

    context 'when a invalid login details is provided' do
      subject { post 'sign_in', params: { email: 'mail.com', password: 'password' } }
      it 'returns a validation error' do
        expect(subject).to redirect_to login_path
        expect(subject).to have_http_status(302)
        expect(flash[:danger]).to match('Invalid login credentials')
      end
    end
  end

  describe '#destroy' do
    context 'when a user clicks the logout button' do
      subject { get 'destroy', params: {} }
      it 'logs the user out in' do
        expect(subject).to redirect_to root_path
        expect(subject).to have_http_status(302)
      end
    end
  end
end
