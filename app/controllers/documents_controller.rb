class DocumentsController < ApplicationController
  def index 
    @folders  = Folder.all
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents

  end

  def edit
    @document = Document.find(params[:id])
    @folder = Folder.find(params[:folder_id])

  end

  def update

    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:id])
    binding.pry
    Document.update(document_params)
    if @document.valid?
      # binding.pry
      @document.save
      return redirect_to folder_documents_path(@folder.id) 
    else
      render "edit"
    end
  end
  


  private

  def document_params
    params.permit(:document_name, images:[]).merge(user_id: current_user.id, folder_id: @folder.id)
  end
end
