class UserDocumentsController < ApplicationController
before_action :set_document, only: %i[show destroy]

  def index
    @documents = current_user.documents
  end

  def new; end
  
  def show; end

  def edit
   if @document.update!(document_params)
      redirect_to user_documents_path
   else
      redirect_to user_document_path
   end
  end

  def destroy
    folder_name = @document.document.blob.key.slice(0, 2)
    @document.document.purge
    @document.destroy
    FileUtils.remove_entry("storage/#{folder_name}", force=false)
    redirect_to user_documents_path
  end

  private

  def set_document
    @document = current_user.documents.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

  def document_params
    params.permit(:title, :description, :document)
  end
end
