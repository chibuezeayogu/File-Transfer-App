# frozen_string_literal: true

class DocumentsController < ApplicationController
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

  private

  def document_params
    params.permit(:title, :description, :document)
  end
end
