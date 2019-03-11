# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) do
    create(:user,
           email: Faker::Internet.email,
           password: 'password',
           password_confirmation: 'password')
  end

  describe '#index' do
    context 'when a user is logged in' do
      before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

      subject { get :index, params: {} }

      it 'redirects to documents_path' do
        expect(subject).to redirect_to documents_path
        expect(subject).to have_http_status(302)
      end
    end
  end
end
