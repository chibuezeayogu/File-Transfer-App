# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:user) do
    create(:user,
           email: Faker::Internet.email,
           password: 'password',
           password_confirmation: 'password')
  end
  let(:valid_params) do
    {
      title: 'new document',
      description: 'testing document',
      document: fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    }
  end
  let(:invalid_params) do
    {
      title: 'new document',
      description: 'testing document'
    }
  end

  describe '#new' do
    context 'when user is not logged in' do
      subject { post :create, params: valid_params }

      it 'redirect to login_path' do
        expect(subject).to have_http_status(302)
        expect(subject).to redirect_to login_path
      end
    end

    context 'when user is logged in and visits /documents route' do
      before do
        allow_any_instance_of(ApplicationController)
          .to receive(:current_user).and_return(user)
      end

      subject { get :index, params: {} }

      it 'renders index template' do
        expect(subject).to render_template :index
      end
    end
  end

  describe '#create' do
    before do
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)
    end

    context 'when user is logged in and provides a valid params' do
      subject { post :create, params: valid_params }

      it 'creates a new document' do
        expect { subject }.to change(ActiveStorage::Attachment, :count).by(1)
      end

      it 'redirects to documents_path' do
        expect(subject).to have_http_status(302)
        expect(subject).to redirect_to documents_path
      end
    end

    context 'when a user is logged in and provides an invalid params' do
      subject { post :create, params: invalid_params }

      it 'redirects to new_document_path' do
        expect(subject).to have_http_status(302)
        expect(subject).to redirect_to new_document_path
      end

      it 'returns a validation error' do
        subject
        expect(flash[:danger]).to match(['Document is required'])
      end
    end
  end

  describe '#show' do
    before do
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)
    end

    context 'when a user clicks view record button' do
      before { post :create, params: valid_params }
      subject { get :show, params: { id: Document.first.id } }

      it 'renders show template' do
        expect(subject).to have_http_status(200)
        expect(subject).to render_template :show
      end
    end

    context 'when record id is not found' do
      subject { get :show, params: { id: 0 } }

      it 'renders 404 page' do
        expect(subject).to have_http_status(404)
        expect(subject).to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end
end
