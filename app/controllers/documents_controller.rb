# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: :show
  def new; end

  def index
    @documents = Document.all
  end

  def create
    document = Document.new(document_params)
    document.user = current_user
    document.document.attach(document_params[:document])
    if document.save
      redirect_to documents_path
    else
      redirect_to new_document_path, danger: document.errors.full_messages
    end
  end

  def show; end

  private

  def set_document
    @document = Document.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

  def document_params
    params.permit(:title, :description, :document)
  end
end
